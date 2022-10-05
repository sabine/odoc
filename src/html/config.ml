(* HTML output configuration *)

module Base = struct
  type t = {
    semantic_uris : bool;
    indent : bool;
    flat : bool;
    open_details : bool;
  }

  let v ~semantic_uris ~indent ~flat ~open_details () =
    { semantic_uris; indent; flat; open_details }
end

module Html_page = struct
  type t = {
    base : Base.t;
    theme_uri : Types.uri option;
    support_uri : Types.uri option;
    omit_breadcrumbs : bool;
    omit_toc : bool;
    content_only : bool;
  }

  let v ?theme_uri ?support_uri ~semantic_uris ~indent ~flat ~open_details
      ~omit_breadcrumbs ~omit_toc ~content_only () =
    let base = { Base.semantic_uris; indent; flat; open_details } in
    { base; theme_uri; support_uri; omit_breadcrumbs; omit_toc; content_only }

  let get_theme_uri config =
    match config.theme_uri with None -> Types.Relative None | Some uri -> uri

  let get_support_uri config =
    match config.support_uri with
    | None -> Types.Relative None
    | Some uri -> uri
end
