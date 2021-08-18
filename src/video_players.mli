[@@@js.stop]

type html_elt = Js_of_ocaml.Dom_html.element Js_of_ocaml.Js.t

[@@@js.start]

[@@@js.implem type html_elt = Js_of_ocaml.Dom_html.element Js_of_ocaml.Js.t]

[@@@js.implem let html_elt_to_js = Obj.magic]

module YT : sig
  type player

  type playerVars

  val playerVars :
    ?mute:int ->
    ?playsinline:int ->
    ?rel:int ->
    ?start:int ->
    unit ->
    playerVars
    [@@js.builder] [@@js.verbatim_names]

  type e

  val is_muted : e -> bool [@@js.get "target.isMuted"]

  val data : e -> int [@@js.get "data"]

  type events

  val events :
    ?onReady:(unit -> unit) -> ?onStateChange:(e -> unit) -> unit -> events
    [@@js.builder] [@@js.verbatim_names]

  type opts

  val opts :
    ?width:int ->
    ?height:int ->
    ?videoId:string ->
    ?playerVars:playerVars ->
    ?events:events ->
    unit ->
    opts
    [@@js.builder] [@@js.verbatim_names]

  val new_player : html_elt -> opts -> player [@@js.new "YT.Player"]

  val destroy : player -> unit [@@js.call]

  val play_video : player -> unit [@@js.call]

  val pause_video : player -> unit [@@js.call]

  val stop_video : player -> unit [@@js.call]
end

module DM : sig
  type player

  type params

  val params :
    ?autoplay:bool ->
    ?controls:bool ->
    ?id:string ->
    ?mute:bool ->
    ?quality:int ->
    ?queue_autoplay_next:bool ->
    ?queue_enable:bool ->
    ?sharing_enable:bool ->
    ?start:int ->
    ?subtitles_default:string ->
    ?syndication:string ->
    ?ui_highlight:string ->
    ?ui_logo:bool ->
    ?ui_start_screen_info:bool ->
    ?playlist:string ->
    ?fullscreen:bool ->
    ?scale_mode:string ->
    ?loop:bool ->
    unit ->
    params
    [@@js.builder] [@@js.verbatim_names]

  type opts

  val opts :
    ?height:int -> ?width:int -> ?video:string -> ?params:params -> unit -> opts
    [@@js.builder] [@@js.verbatim_names]

  val new_player : html_elt -> opts -> player [@@js.global "DM.player"]

  val id : player -> string [@@js.get "id"]

  val muted : player -> bool [@@js.get]

  val destroy : player -> string -> unit [@@js.call]

  val play : player -> unit [@@js.call]

  val pause : player -> unit [@@js.call]

  val add_event_listener : player -> event:string -> (unit -> unit) -> unit
    [@@js.call]
end
