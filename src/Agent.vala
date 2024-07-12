namespace Ag {
    public class Agent : PolkitAgent.Listener {
        public async override bool initiate_authentication (string action_id, string message, string icon_name, 
            Polkit.Details details, string cookie, GLib.List<Polkit.Identity> identities, GLib.Cancellable? cancellable) throws Polkit.Error {

            if (identities == null) {
                return false;
            };

            var dialog = new Ag.Dialog (message, cookie, identities, cancellable);

            var provider = new Gtk.CssProvider ();
            provider.load_from_resource ("/com/github/XtremeTHN/KAgent/style.css");

            dialog.get_style_context ().add_provider (provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);

            dialog.done.connect (() => initiate_authentication.callback ());

            dialog.present ();
            yield;

            dialog.destroy ();

            if (dialog.was_cancelled) {
                throw new Polkit.Error.CANCELLED ("Authentication dialog was dismissed by the user");
            }

            return true;
        }
    }
}