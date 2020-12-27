#' brl_begin
#' @title Generate and optimize a braille-embedded ready-to-print pdf file for swell form machine or braille embosser

#' @aliases brl_begin
#' @keywords brl_begin

#' @description Opening braille device for your graphic. Just surround any graphic object between two functions brl_begin() and brl_end(). The graph will be created in PDF format in your current directory, with all text being presented using  a braille font. See more details in the example section below.

#' @export brl_begin
#' @param file A character string giving the filename where the image is to be saved. The default file name is "tactile.pdf" if not given.
#' @param pt Numeric value specifying braille font size for a created file. Default is 11.
#' @param paper Character value setting paper size of output pdf file. Default is "special".
#' @param font Character value for font family. Available options include "BRL" for "BRAILLE1.ttf" (Braille Normal) and "SWL" for "Swell-Braille.ttf" (Swell Braille), and "TIMES" for "times.ttf" (Times New Roman). Default is set to "BRL".

#' @details
#' *Note*: This function optimizes for both 11*11 and 11*8.5 swell touch papers. When printing a generated braille pdf, just remember two things:
#' 1. check "Fit" in the print dialog box (the shortcut key is ALT+F).
#' 2. Check "Landscape" in the print dialog box as well.
#' * For boxplot, you do not need to check the "Landscape," just leave it as a "Portray." However, please check the "Fit" all the time.

#' Information:
#' If you are not familiar with what swell form machine is, please refer to \href{http://www.americanthermoform.com/product/swell-form-graphics-ii-machine/}{this web site}.
#' A short \href{https://www.youtube.com/watch?v=ClI555l4Z1M}{YouTube video} will help you to understand how this function can be employed in conjunction with Swell form machine.

#' @return Nothing within the R session, but a pdf file will be created in the user's working directory.

#' @examples
#' brl_begin(file = "tactile.pdf", pt = 11, paper = "special", font = "BRL")
#' hist(airquality$Ozone)
#' brl_end()
#' # The braille ready-to-print pdf version will be created in your working directory.
#' # Print it out and run the swell touch paper through swell form heating machine.
#' @author JooYoung Seo, \email{jooyoung@psu.edu}

# Function starts
brl_begin <-
  function(file = "tactile.pdf", pt = 11, paper = "special", font = "BRL") {

    # Body code Starts here
    # Preparing braille font
    sysfonts::font.add("BRL", system.file("fonts/BRAILLE1.ttf", package = "tactileR"))
    sysfonts::font.add("SWL", system.file("fonts/Swell-Braille.ttf", package = "tactileR"))
    sysfonts::font.add("TIMES", system.file("fonts/times.ttf", package = "tactileR"))

    # Generating Braille PDF
    grDevices::pdf(file, pointsize = pt, paper = paper)
    showtext::showtext.begin()
    # Optimizing graphic size
    graphics::par(cex = 1.2, cex.main = 1.2, cex.lab = 1.2, cex.axis = 1.2, cex.sub = 1.2, mar = c(5, 5, 3, 2), pch = 20, family = font)

    # Body code ends
  }
# Function Ends
