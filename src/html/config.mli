(* HTML renderer configuration *)

module Base : sig
  type t = {
    semantic_uris : bool;
    indent : bool;
    flat : bool;
    open_details : bool;
  }

  val v :
    semantic_uris:bool ->
    indent:bool ->
    flat:bool ->
    open_details:bool ->
    unit ->
    t
end

module Html_page : sig
  type t = {
    base : Base.t;
    theme_uri : Types.uri option;
    support_uri : Types.uri option;
    omit_breadcrumbs : bool;
    omit_toc : bool;
    content_only : bool;
  }

  val v :
    ?theme_uri:Types.uri ->
    ?support_uri:Types.uri ->
    semantic_uris:bool ->
    indent:bool ->
    flat:bool ->
    open_details:bool ->
    omit_breadcrumbs:bool ->
    omit_toc:bool ->
    content_only:bool ->
    unit ->
    t

  val get_theme_uri : t -> Types.uri

  val get_support_uri : t -> Types.uri
end
