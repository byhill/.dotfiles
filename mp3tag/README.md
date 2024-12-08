# MP3Tag

[MP3Tag](https://www.mp3tag.de/en/) is a tag editor for audio files.

## Settings

To import settings, use
```
defaults import app.mp3tag.Mp3tag /path/to/settings.plist
defaults delete app.mp3tag.Mp3tag SecurityScopedBookmarks
```

To export, use
```
defaults export app.mp3tag.Mp3tag /path/to/newsettings.plist
```

See [here](https://community.mp3tag.de/t/preferences-and-configuration/56296#exporting-and-importing-preferences-settings-12) for details.
