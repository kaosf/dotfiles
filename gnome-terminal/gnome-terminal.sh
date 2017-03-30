# Get an information for GNOME Terminal profile configurations
gsettings list-schemas | grep Terminal
gsettings list-keys org.gnome.Terminal.Legacy.Settings
gsettings list-keys org.gnome.Terminal.ProfilesList
gsettings list-recursively
# Get a list including a UUID of the default profile
gsettings list-recursively org.gnome.Terminal.ProfilesList
# Get the UUID
gsettings get org.gnome.Terminal.ProfilesList default

UUID=$(gsettings get org.gnome.Terminal.ProfilesList default | sed "s/'//g")

gsettings list-keys org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ > keys.txt
for i in $(gsettings list-keys org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/); do
  gsettings get org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ ${i}
done > values.txt

INDEX=1
for i in `cat keys.txt`; do
  KEY=${i}
  VALUE=$(head -${INDEX} values.txt | tail -1)
  INDEX=$((INDEX + 1))
  gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${UUID}/ ${KEY} "${VALUE}"
done

# ref.
#   https://twitter.com/func_hs/status/847431875505266688
#   https://twitter.com/func_hs/status/847432651183017984
#   https://wiki.gnome.org/Apps/Terminal/FAQ
#   https://git.gnome.org/browse/gnome-terminal/tree/src/org.gnome.Terminal.gschema.xml

# gnome-terminal --version
#=> GNOME Terminal 3.22.1 Using VTE version 0.46.1 +GNUTLS
# gsettings --version
#=> 2.50.3
