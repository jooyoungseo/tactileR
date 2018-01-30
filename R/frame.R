
frame <- function(tmp='article', pkg='tactileR') {

message("\nEnter your project name.")
file <- readLines(n = 1)
if (file == "") {file = "new project"}

if(tmp != 'week') {
message("\nEnter the title of your paper.")
title <- readLines(n = 1)
if (title == "") {title = "Untitled"}
}

if(tmp == 'article') {
message("\nEnter the running head.")
short <- readLines(n = 1)
if (short == "") {short = "runninghead"}
}

if(tmp %in% c('article', 'pt', 'reaction', 'week', 'html')) {
rmarkdown::draft(paste0(file, '.Rmd'), template=tmp, package=pkg, create_dir=T, edit=F)
} else {
rmarkdown::draft(paste0(file, '.Rmd'), template=tmp, package=pkg, create_dir=T, edit=T)
}

if(tmp != 'week') {
titleFile <- file(paste0(file, '/title.txt'))
writeLines(title, titleFile)
close(titleFile)
}
if(tmp == 'article') {
write(toupper(short), paste0(file, '/title.txt'), append=T)
}

if(tmp == 'article') {
fileConn <- file(paste0(file, '/run.R'))
writeLines(c(
paste0('rmarkdown::render(normalizePath("', file, '.Rmd"), output_format="papaja::apa6_word")'), 
paste0('rmarkdown::render(normalizePath("', file, '.Rmd"), output_format="papaja::apa6_pdf")'), 
paste0('rmarkdown::render(normalizePath("', file, '.Rmd"), output_format="html_document")'), 
 paste0('browseURL(normalizePath("', file, '.docx"))'), 
paste0('browseURL(normalizePath("', file, '.pdf"))'),
paste0('rmarkdown::render(normalizePath("', file, '.Rmd"), output_format="powerpoint_presentation")') 
), fileConn)
close(fileConn)
file.edit(paste0(file, '/', 'main.txt'))
} else if(tmp %in% c('reaction', 'week', 'pt', 'html')) {
fileConn <- file(paste0(file, '/run.R'))
writeLines(c(
paste0('rmarkdown::render(normalizePath("', file, '.Rmd"), rmarkdown::word_document(toc=T, toc_depth=3, highlight="tango", reference_docx = system.file("rmarkdown/templates/apa6/resources/apa6_man.docx", package="papaja")))'), 
paste0('rmarkdown::render(normalizePath("', file, '.Rmd"), output_format="powerpoint_presentation")'), 
paste0('rmarkdown::render(normalizePath("', file, '.Rmd"), output_format="pdf_document")'), 
paste0('browseURL(normalizePath("', file, '.docx"))'), 
paste0('browseURL(normalizePath("', file, '.pdf"))'), 
paste0('rmarkdown::render(normalizePath("', file, '.Rmd")')
), fileConn)
close(fileConn)
file.edit(paste0(file, '/', 'main.txt'))
} else {
fileConn <- file(paste0(file, '/run.R'))
writeLines(c(paste0('rmarkdown::render(normalizePath("', file, '.Rmd"))'), 
paste0('browseURL(normalizePath("', file, '.pptx"))'), 
paste0('browseURL(normalizePath("', file, '.html"))'), 
paste0('browseURL(normalizePath("', file, '.docx"))'), 
paste0('browseURL(normalizePath("', file, '.pdf"))')), fileConn)
close(fileConn)
}

browseURL(normalizePath(paste0(file, '/bib/references.bib')))

# Google Scholar
scholar <- as.logical(readline("\nDo you want to open Google Scholar? (No)\n"))
if (is.na(scholar)) scholar <- FALSE
if (scholar) {
browseURL('http://scholar.google.com')
}

readline(
"Press <enter> once the viewing and editing is completed. \nThen, the source file will be processed.")

if(tmp == 'article') {
sink(paste0(file, '/log.txt'))
rmarkdown::render(paste0(file, '/', file, '.Rmd'), output_format="papaja::apa6_word")
sink()
} else if(tmp %in% c("reaction", "week")) {

sink(paste0(file, '/log.txt'))
rmarkdown::render(paste0(file, '/', file, '.Rmd'), rmarkdown::word_document(toc=T, toc_depth=3, highlight="tango", reference_docx = system.file("rmarkdown/templates/apa6/resources/apa6_man.docx", package="papaja")))
sink()

} else {
sink(paste0(file, '/log.txt'))
rmarkdown::render(paste0(file, '/', file, '.Rmd'))
sink()
}


readline(
"Press <enter> to view the output file.")

if(file.exists(paste0(file, "/", file, ".docx"))) {browseURL(normalizePath(paste0(file, "/", file, ".docx")))}
else if(file.exists(paste0(file, "/", file, ".pptx"))) {browseURL(normalizePath(paste0(file, "/", file, ".pptx")))}
else if(file.exists(paste0(file, "/", file, ".html"))) {browseURL(normalizePath(paste0(file, "/", file, ".html")))}

readline(
"Press <enter> to working directory of the current project.")

browseURL(normalizePath(file))

if(tmp == 'article') {

pdfOK <- as.logical(readline("\nDo you want to make pdf file? (No)\n"))
if (is.na(pdfOK)) pdfOK <- FALSE
if (pdfOK) {
rmarkdown::render(normalizePath(paste0(file, '/', file, '.Rmd')), output_format='papaja::apa6_pdf')
if(file.exists(paste0(file, "/", file, ".pdf"))) {browseURL(normalizePath(paste0(file, "/", file, ".pdf")))}
}

}
}

