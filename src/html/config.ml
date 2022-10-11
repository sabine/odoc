type t = {
  semantic_uris : bool;
  indent : bool;
  flat : bool;
  open_details : bool;
  theme_uri : Types.uri option;
  support_uri : Types.uri option;
  as_json : bool;
}

let v ?theme_uri ?support_uri ~semantic_uris ~indent ~flat ~open_details
    ~as_json () =
  { semantic_uris; indent; flat; open_details; theme_uri; support_uri; as_json }

let get_theme_uri config =
  match config.theme_uri with None -> Types.Relative None | Some uri -> uri

let get_support_uri config =
  match config.support_uri with None -> Types.Relative None | Some uri -> uri
