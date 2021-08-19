# ocaml-video-players

## What does ocaml-video-players do ?

This plugin allows you to add different video players to add in your
ocaml mobile app.

This plugin is binding to several repositories, each of one define on
specific player:

The *YouTube* video player
The *Daillymotion* video player
The *Vimeo* video player

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

### What is a `html_elt` value ?

The video players of this plugin need a `html_elt` value as first
argument, it is a value of type `Dom_html.element Js.t` from the
`Js_of_ocaml` library. You can see more details about this type on the
[Js_of_ocaml official
documentation](https://ocsigen.org/js_of_ocaml/3.1.0/api/Dom_html.element-c)

### Create a *YouTube* video player

See the [YouTube IFrame Player
API](https://developers.google.com/youtube/iframe_api_reference) for
more details.

The module `YT` contains everything you need to add a *YouTube* video
plugin into your ocaml mobile app.

The main function that you need create à *YouTube* player is the
`YT.new_player` function: it take a `html_elt` and an `opt` element as
argument, the `opt` contains all the optional value you can give to
define your player. The function will return a `YT.player` object that
you can use to call others functions of this module

#### The `opt` of a *Youtube* player

[... TODO ...]

### Create a *Dailymotion* video player

See the [Dailymotion IFrame Player
API](https://developer.dailymotion.com/player/#player-api) for more
details.

The module `DM` contains everything you need to add a *Dailymotion*
video plugin into your ocaml mobile app.

[... TODO ...]

### Create a *Vimeo* video player

See the [Vimeo IFrame Player
API](https://developer.vimeo.com/player/sdk) for more details.
