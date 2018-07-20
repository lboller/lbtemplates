# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

pdf_memo = function(toc = FALSE) {
  # locations of resource files in the package
  pkg_resource = function(...) {
    system.file(..., package = "lbtemplates")
  }

  preamble = pkg_resource("rmarkdown/templates/memo_with_templates/skeleton/preamble.tex")

  # call the base html_document function
  bookdown::pdf_document2(
    toc = toc,
    fig_width = 6.5,
    fig_height = 4,
    fig_caption = TRUE,
    includes = rmarkdown::includes(in_header = preamble)
  )
}

word_memo = function(toc = FALSE) {
  # locations of resource files in the package
  pkg_resource = function(...) {
    system.file(..., package = "lbtemplates")
  }

  template = pkg_resource("rmarkdown/templates/memo_with_templates/skeleton/template.docx")

  # call the base html_document function
  bookdown::word_document2(
    toc = toc,
    fig_width = 6.5,
    fig_height = 4,
    fig_caption = TRUE,
    reference_docx = template
  )
}
