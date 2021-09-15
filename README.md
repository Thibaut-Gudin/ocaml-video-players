# ocaml-js-video-players

## What does ocaml-js-video-players do ?

This plugin allows you to add different video players to add in your
ocaml mobile app.

This plugin is binding to several repositories, each of one define on
specific player:

-The *YouTube* video player

-The *Daillymotion* video player

-The *Vimeo* video player

## How to install and compile your project by using this plugin ?

You can use opam by pinning the repository with:
```Shell
opam pin add video-players https://github.com/besport/ocaml-js-video-players
```

to compile your project, use:
```Shell
dune build @install
```

Finally, install the "js-video-players" plugin with:
```Shell
cordova plugin add js-video-players
```


## How to use it?

### What is a `html_elt` value ?

The video players of this plugin need a `html_elt` value as first
argument, it is a value of type `Dom_html.element Js.t` from the
`Js_of_ocaml` library. You can see more details about this type on the
[Js_of_ocaml official
documentation](https://ocsigen.org/js_of_ocaml/3.1.0/api/Dom_html.element-c). You
can obtains that kind of values with function like
`Eliom_content.Html.To_dom.of_element`, you can see the [official
documentation](https://ocsigen.org/js_of_ocaml/latest/api/js_of_ocaml-tyxml/Js_of_ocaml_tyxml/Tyxml_cast_sigs/module-type-OF/index.html)
for more details

### Create a *YouTube* video player

See the [YouTube IFrame Player
API](https://developers.google.com/youtube/iframe_api_reference) for
more details.

The module `YT` contains everything you need to add a *YouTube* video
player into your ocaml mobile app.

The main function that you need create à *YouTube* player is the
`YT.new_player` function: it take a `html_elt` and an `opts` element as
argument, the `opts` contains all the optional value you can give to
define your player. The function will return a `YT.player` object that
you can use to call others functions of this module.

For example, with a given element *placeholder* you can create a
*YouTube* player with:

```Ocaml
let yt_opts =
    Js_video_players.YT.opts ~width:200 ~height:300 ~videoId:"your_youtube_video_ID"
      ~playerVars:
        (Js_video_players.YT.playerVars ~mute:0 ~playsinline:1 ())
      ~events:
        (Js_video_players.YT.events
                ~onReady:(fun _ -> ignore (print_endline "ready") ())
                ()
        )
  in
  let player =
    Js_video_players.YT.new_player (Eliom_content.Html.To_dom.of_element placeholder) yt_opts
  in
  Js_video_players.YT.play_video player
```

#### The `YT.set_on_iframe_api_ready` function

This function is an ocaml binding for seting the currente value of
`onYouTubeAPIReady`, this function is called once the *YouTube*
JavaScript API is loaded. You can use this function to execute a
callback when this API is loaded.

The the [official
documentation](https://developers.google.com/youtube/iframe_api_reference#Loading_a_Video_Player)
for more details.

#### The `opts` of a *YouTube* player

The options object `opts` to create a *YouTube* player contains 5 values:
the width of the player, the height, id of the video that you want to
put in the player and 2 other kind of objects containing optional
values: a `playerVars` object and an `event` object, you can see more
details in the ".mli" file and in the YouTube IFrame Player API.

We can specify the case of the optional argument `onStateChange` of the
`events` optional value of `opts`: it is a call-back that take an
argument of type `e`, you must use function from the `YT` module if you
want to use this argument correctly if you want to define that optional
argument.

#### The *YouTube* player functions

The other function of this module must be used with a `player` object
created with this plugin, you can apply several function in it like for
example the `Js_video_players.YT.destroy` function to destroy the player
from your application.

### Create a *Dailymotion* video player

See the [Dailymotion IFrame Player
API](https://developer.dailymotion.com/player/#player-api) for more
details.

The module `DM` contains everything you need to add a *Dailymotion*
video player into your ocaml mobile app.

The main function that you need create à *Dailymotion* player is the
`DM.new_player` function: it take a `html_elt` and an `opts` element as
argument, the `opts` contains all the optional value you can give to
define your player. The function will return a `DM.player` object that
you can use to call others functions of this module (like with the YT
module).

The `opts` of a *Dailymotion* player can contains an optional `params`
objects that define several optional values, you can see all the
possible values in the ".mli" file.

#### The `DM.set_async_init` function

This function is an ocaml binding for setting the `dmAsyncInit` function
current value, this can be used for loading the SDK asynchronously.

See the [official
documentation](https://developer.dailymotion.com/tools/sdks/#sdk-javascript-loading-asynchronously)
for more details.

### Create a *Vimeo* video player

See the [Vimeo IFrame Player
API](https://developer.vimeo.com/player/sdk) for more details.

The module `Vimeo` contains everything you need to add a *Vimeo* video
player into your ocaml mobile app

The main function that you need create à *Vimeo* player is the
`Vimeo.new_player` function: it take a `html_elt` and an `opts` element as
argument, the `opts` contains all the optional value you can give to
define your player (you can see all the possible values in the ".mli"
file). The function will return a `Vimeo.player` object that you can use
to call others functions of this module (like with the other modules).
