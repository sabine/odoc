(* HTML renderer configuration *)

type t = {
  semantic_uris : bool;
  indent : bool;
  flat : bool;
  open_details : bool;
  (* only for HTML page rendering*)
  theme_uri : Types.uri option;
  support_uri : Types.uri option;
  (* output HTML fragments and metadata in JSON format *)
  as_json : bool;
}

val v :
  ?theme_uri:Types.uri ->
  ?support_uri:Types.uri ->
  semantic_uris:bool ->
  indent:bool ->
  flat:bool ->
  open_details:bool ->
  as_json:bool ->
  unit ->
  t

val get_theme_uri : t -> Types.uri

val get_support_uri : t -> Types.uri
