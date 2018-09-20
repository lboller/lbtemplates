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

#' PDF Memo
#'
#' @param toc
#'
#' @return
#' @export
pdf_memo = function(toc = FALSE, ...) {
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
    includes = rmarkdown::includes(in_header = preamble),
    number_sections = FALSE,
    ...
  )
}

#' Word Memo
#'
#' @param toc
#'
#' @return
#' @export
word_memo = function(toc = FALSE, ...) {
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

#' Word Memo w/ Numbers
#'
#' @param toc
#'
#' @return
#' @export
word_memo_numbers = function(toc = FALSE) {
  # locations of resource files in the package
  pkg_resource = function(...) {
    system.file(..., package = "lbtemplates")
  }

  template = pkg_resource("rmarkdown/templates/memo_with_templates/skeleton/template_numbers.docx")

  # call the base html_document function
  bookdown::word_document2(
    toc = toc,
    fig_width = 6.5,
    fig_height = 4,
    fig_caption = TRUE,
    reference_docx = template
  )
}

#' Word Paper
#'
#' @param toc
#'
#' @return
#' @export
word_paper = function(toc = FALSE) {
  # locations of resource files in the package
  pkg_resource = function(...) {
    system.file(..., package = "lbtemplates")
  }

  template = pkg_resource("rmarkdown/templates/memo_with_templates/skeleton/paper.docx")

  # call the base html_document function
  bookdown::word_document2(
    toc = toc,
    fig_width = 6.5,
    fig_height = 4,
    fig_caption = TRUE,
    reference_docx = template
  )
}

#' Subscript
#'
#' @param text Text to insert
#'
#' @return
#' @export
subscript = function(text = "_") {
  rstudioapi::insertText(paste0(text, "{}"))
  temp <- rstudioapi::getSourceEditorContext()$selection[[1]]$range
  go_to <- rstudioapi::document_range(
    c(temp$start[[1]],temp$start[[2]] - 1), c(temp$end[[1]],temp$end[[2]] - 1)
  )
  rstudioapi::setSelectionRanges(go_to)
}

