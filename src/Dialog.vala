
public class Ag.Dialog : Gtk.Window {
    private string cookie;
    private unowned List<Polkit.Identity?>? _idents;
    private Cancellable _cancellable;

    public signal void done ();

    public Dialog (string msg, string icon_name, string _cookie, List<Polkit.Identity?>? idents, Cancellable cancellable) {
        Object (title: "Authentication needed");

        cookie = _cookie;
        _idents = idents;
        _cancellable = cancellable;

        Gtk.Box root = new Gtk.Box (Gtk.Orientation.VERTICAL, 5);

        Gtk.Label title = new Gtk.Label ("Authentication required");
        title.add_css_class ("title-2");

        Gtk.Label subtitle = new Gtk.Label (msg);

        root.append (title);
        root.append (subtitle);

        set_child (root);
    }
}
