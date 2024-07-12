/* application.vala
 *
 * Copyright 2024 Unknown
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

namespace Kagent {
    public class App : Adw.Application {
        public App () {
            Object (
                application_id: "com.github.XtremeTHN.KAgent", 
                flags: ApplicationFlags.IS_SERVICE, 
                register_session: true
            );
        }

        protected override void startup () {
            base.startup ();

            var agent = new Ag.Agent ();
            var provider = new Gtk.CssProvider ();
            provider.load_from_resource ("/com/github/XtremeTHN/KAgent/style.css");
            
            Gtk.StyleContext.add_provider_for_display (Gdk.Display.get_default (), provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);

            try {
                var subject = new Polkit.UnixSession.for_process_sync (Posix.getpid(), new Cancellable ());
                agent.register (NONE, subject, "/com/github/XtremeTHN/KAgent", new Cancellable ());
            } catch (Error e) {
                critical ("Error while trying to register the authentication agent: %s", e.message);
            }

            hold();
        }

        public static int main(string[] args) {
            var app = new Kagent.App ();
    
            return app.run (args);
        }
    }
}
