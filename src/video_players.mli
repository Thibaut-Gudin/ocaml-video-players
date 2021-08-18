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
