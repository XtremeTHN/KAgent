namespace Ag {
    public class Agent : PolkitAgent.Listener {
        public async override bool initiate_authentication (string action_id, string message, string icon_name, 
            Polkit.Details details, string cookie, GLib.List<Polkit.Identity> identities, GLib.Cancellable? cancellable) throws Polkit.Error {

            if (identities == null) {
                return false;
            };

            var dialog = new Ag.Dialog (message, cookie, identities, cancellable);

            

            dialog.done.connect (() => initiate_authentication.callback ());

            dialog.present ();
            yield;

            dialog.destroy ();

            if (dialog.was_cancelled) {
                throw new Polkit.Error.CANCELLED ("Authentication dialog was dismissed by the user");
            }

            warning ("terminated");
            return true;
        }
    }
}