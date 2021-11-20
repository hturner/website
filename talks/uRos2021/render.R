# this allows me to use pandoc style citations and csl bibliographic styles
nm <- "talks/uRos2021/test" # without file extension

# render to markdown first - handles citations
# repeat each time you want to update
# [can't use markdown output as does not keep div, e.g. when centering figures;
# so add necessary to markdown_strict. Seem to need to add yaml back in; also
# put back remark.js specific things (--- is new slide not horizontal line;
# don't want to escape [] in .pull-left and .pull-right). Use -citations
# on output to convert to plain text (https://superuser.com/a/1161832/217456)
# --markdown-headings=atx avoids problems with colons in headers (e.g. "# Example: Data")
library(rmarkdown)
render(paste0(nm, ".Rmd"),
       output_format = output_format(
           knitr = knitr_options(opts_chunk = list(dev = 'png')),
           pandoc = pandoc_options(to = "markdown_strict+yaml_metadata_block+pipe_tables+backtick_code_blocks+tex_math_dollars-citations",
                                   from = "markdown_strict+yaml_metadata_block+pipe_tables+backtick_code_blocks+tex_math_dollars+citations",
                                   args = "--markdown-headings=atx"),
           post_processor = function(metadata, input_file, output_file,
                                 clean, verbose) {
               input <- readLines(input_file, warn = FALSE)
               end <- grep("^---", input)[2]
               lines <- readLines(output_file, warn = FALSE)
               lines <- gsub("^[-]+$", "---", lines)
               lines <- gsub("\\[", "[", lines, fixed = TRUE)
               lines <- gsub("\\]", "]", lines, fixed = TRUE)
               output_lines <- c(input[seq(end)], "", lines)
               writeLines(output_lines, output_file, useBytes = TRUE)
               output_file
           }
        ),
       output_file = paste0(basename(nm), ".md"),
       clean = FALSE)


# infinitely render markdown file - only needs be done once, they will
# happen each time the Rmd is re-rendered (and saves position in viewer)
library(xaringan)
inf_mr(paste0(nm, ".md"))

# N.B. better than RefManageR as default style is odd and hard to define custom
# style; can't use knitcitations as relies on RefManageR. Both more fiddly in
# Rmd itself
# http://editor.citationstyles.org/searchByExample/


# subtracting from markdown is another alternative, but adds in unnecessary(?)
# div; still need to fix lines and columns
render("Thursday-AM-Heather-Turner.utf8.md",
       output_file = "test.md",
       output_format = output_format(
           knitr = knitr_options(opts_chunk = list(dev = 'png')),
           pandoc = pandoc_options(to = "markdown-native_divs-header_attributes-citations-fenced_divs",
                                   from = "markdown-native_divs-header_attributes")))
