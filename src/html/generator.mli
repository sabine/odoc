val render :
  config:Config.Html_page.t ->
  Odoc_document.Types.Page.t ->
  Odoc_document.Renderer.page list

val render_fragment_with_meta :
  config:Config.Base.t ->
  Odoc_document.Types.Page.t ->
  Odoc_document.Renderer.page list

val doc :
  config:Config.Base.t ->
  xref_base_uri:string ->
  Odoc_document.Types.Block.t ->
  Html_types.flow5_without_sectioning_heading_header_footer Tyxml.Html.elt list
