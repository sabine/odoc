module Html = Tyxml.Html

val make :
  config:Config.Base.t ->
  preamble:Html_types.div_content Html.elt list ->
  url:Odoc_document.Url.Path.t ->
  kind:Odoc_document.Types.Page.kind ->
  breadcrumbs:Types.breadcrumb list ->
  toc:Types.toc list ->
  uses_katex:bool ->
  title:string ->
  Html_types.div_content Html.elt list ->
  Odoc_document.Renderer.page list ->
  Odoc_document.Renderer.page list
