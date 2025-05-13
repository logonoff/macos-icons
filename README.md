# macOS XDG icon theme

This is a [XDG icon theme](https://specifications.freedesktop.org/icon-theme-spec/latest/) containing official macOS icons for use on Linux desktops + [macOS cursors](https://github.com/ful1e5/apple_cursor) by [ful1e5](https://github.com/ful1e5).


## Installation

Clone this repo to `~/.icons`. Then change the icon theme in your desktop environment settings to `macos-icons`.

```bash
cd ~/.icons # make this directory if it doesn't exist
git clone https://github.com/logonoff/macos-icons

# GNOME:
gsettings set org.gnome.desktop.interface icon-theme "macos-icons"
gsettings set org.gnome.desktop.interface cursor-theme "macos-icons"
```


## Contributing

Icons must come directly from the developer of the application, published in their macOS distribution of the app.
You may change the `Inherits` property in `index.theme` to inherit from another icon theme, but the addition of
custom-made icons are not in scope for this project.

Once the official `icns` file is downloaded, you can import it with the following command (`icns2png` is required):

```bash
./import.sh --app [app_name] [path_to_icns_file]

# Example:
./import.sh --app org.mozilla.firefox ./firefox.icns
```

The `app_name` should be the FlatHub identifier of the app. To create aliases for non-FlatHub installations,
run the following command:

```bash
./import.sh --alias [app_name] [aliased_name]

# Example:
./import.sh --alias org.mozilla.firefox firefox
```


## License

The cursors are GPLv3. The icons are property of their respective owners. `index.theme` is based off
of [`pop-icon-theme`](https://github.com/pop-os/icon-theme) and is licensed under CC-BY-SA-4.0.
