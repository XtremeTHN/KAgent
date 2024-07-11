
[GtkTemplate (ui = "/com/github/XtremeTHN/KAgent/dialog.ui")]
public class Ag.Dialog : Adw.Window {
    [GtkChild]
    private Gtk.Label message;

    [GtkChild]
    private Gtk.DropDown users_combo;

    [GtkChild]
    private Gtk.PasswordEntry password;

    [GtkChild]
    private Gtk.Revealer error_revealer;

    [GtkChild]
    private Gtk.Label error_label;

    [GtkChild]
    private Gtk.Button auth_btt;

    public signal void done ();

    private string _cookie;
    private unowned List<Polkit.Identity?>? _idents;
    private Cancellable _cancellable;

    public Dialog (string msg, string icon_name, string cookie, List<Polkit.Identity?>? idents, Cancellable cancellable) {
        message.label = msg;

        _idents = idents;
        _cookie = cookie;
        _cancellable = cancellable;
    }
}
//  public class Ag.Dialog : Adw.Window {
//      private string cookie;
//      private unowned List<Polkit.Identity?>? _idents;
//      private Cancellable _cancellable;

//      public signal void done ();

//      public Dialog (string msg, string icon_name, string _cookie, List<Polkit.Identity?>? idents, Cancellable cancellable) {
//          Object (title: "Authentication needed");

//          cookie = _cookie;
//          _idents = idents;
//          _cancellable = cancellable;

//          Gtk.Box root = new Gtk.Box (Gtk.Orientation.VERTICAL, 5);

//          Gtk.Label title = new Gtk.Label ("Authentication required");
//          title.add_css_class ("title-2");

//          Gtk.Label subtitle = new Gtk.Label (msg);

//          Gtk.Box entry_box = new Gtk.Box ()

//          root.append (title);
//          root.append (subtitle);

//          set_child (root);
//      }
//  }
