# ocaml-video-players

## What does ocaml-video-players do ?

This plugin allows you to add different video players to add in your
ocaml mobile app.

This plugin is binding to several repositories, each of one define on
specific player:
The [youtube video player](https://github.com/feross/yt-player)
The [daillymotion video player](https://github.com/u-wave/react-dailymotion)
The [vimeo video player](https://github.com/vimeo/player.js)

## How to install and compile your project by using this plugin ?

You can use opam by pinning the repository with:
```Shell
opam pin add video-players https://github.com/besport/ocaml-video-players
```

to compile your project, use:
```Shell
dune build @install
```

Finally, install the "video-players" plugin with:
```Shell
cordova plugin add video-players
```


## How to use it?

### Create a *YouTube* video player

See the [YouTube IFrame Player
API](https://developers.google.com/youtube/iframe_api_reference) for
more details.

The module `YT` contains everything you need to add a *YouTube* video
plugin into your ocaml mobile app.

[... TODO ...]

### Create a *Dailymotion* video player

See the [Dailymotion IFrame Player
API](https://developer.dailymotion.com/player/#player-api) for more
details.

The module `DM` contains everything you need to add a *Dailymotion*
video plugin into your ocaml mobile app.

[... TODO ...]
