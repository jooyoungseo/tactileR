#' brl_end
#' @title Generate and optimize a braille-embedded ready-to-print pdf file for swell form machine or braille embosser

#' @aliases brl_end
#' @keywords brl_end

#' @description Closing braille device for your graphic. Just surround any graphic object between two functions brl_begin() and brl_end(). The graph will be created in PDF format in your current directory, with all text being presented using  a braille font. See more details in the example section below.

#' @export brl_end

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
brl_end <-
  function() {

    # Body code Starts here
    showtext::showtext.end()
    grDevices::dev.off()

    # Body code ends
  }
# Function Ends
