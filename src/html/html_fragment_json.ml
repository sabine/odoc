(* Rendering of HTML fragments together with metadata for
   embedding docs in existing websites
*)

module Html = Tyxml.Html

let string_of_kind kind =
  match kind with
  | `BaseModule -> "BaseModule"
  | `Module -> "Module"
  | `Argument -> "Parameter"
  | `ModuleType -> "ModuleType"
  | `ClassType -> "ClassType"
  | `Class -> "Class"
  | `Page -> "Page"

let json_of_breadcrumbs (breadcrumbs : Types.breadcrumb list) : Utils.Json.json =
  let breadcrumb (b : Types.breadcrumb) =
    `Object [ ("name", `String b.name); ("href", `String b.href) ]
  in
  let json_breadcrumbs = breadcrumbs |> List.map breadcrumb in
  `Array json_breadcrumbs

let json_of_toc (toc : Types.toc list) : Utils.Json.json =
  let rec section (s : Types.toc) =
    `Object
      [
        ("title", `String s.title_str);
        ("href", `String s.href);
        ("children", `Array (List.map section s.children));
      ]
  in
  let toc_json_list = toc |> List.map section in
  `Array toc_json_list

let make ~config:{Config.Base.flat; indent ; _} ~preamble ~url ~kind ~breadcrumbs ~toc ~uses_katex ~title
    content children =
  let filename = Link.Path.as_filename ~is_flat:flat url in
  let htmlpp = Html.pp_elt ~indent () in
  let json_to_string json =
    Utils.Json.to_string json
  in
  let content ppf =
    Format.pp_print_string ppf
      (json_to_string
         (`Object
           [
             ("uses_katex", `Bool uses_katex);
             ("title", `String title);
             ("kind", `String (string_of_kind kind));
             ("breadcrumbs", json_of_breadcrumbs breadcrumbs);
             ("toc", json_of_toc toc);
             ( "preamble",
               `String
                 (String.concat ""
                    (List.map (Format.asprintf "%a" htmlpp) preamble)) );
             ( "content",
               `String
                 (String.concat ""
                    (List.map (Format.asprintf "%a" htmlpp) content)) );
           ]))
  in
  [ { Odoc_document.Renderer.filename; content; children } ]
