#' BRL.end
#' @title Generate and optimize a braille-embedded ready-to-print pdf file for swell form machine or braille embosser

#' @aliases BRL.end
#' @keywords BRL.end

#' @description Closing braille device for your graphic. Just surround any graphic object between two functions BRL.begin() and BRL.end(). The graph will be created in PDF format in your current directory, with all text being presented using  a braille font. See more details in the example section below.

#' @export BRL.end

#' @details
#' *Note*: This function optimizes for both 11*11 and 11*8.5 swell touch papers. When printing a generated braille pdf, just remember two things:
#' 1. check "Fit" in the print dialog box (the shortcut key is ALT+F).
#' 2. Check "Landscape" in the print dialog box as well.
#' * For boxplot, you do not need to check the "Landscape," just leave it as a "Portray." However, please check the "Fit" all the time.

#' Information:
#' If you are not familiar with what swell form machine is, please refer to [this web site](http://www.americanthermoform.com/product/swell-form-graphics-ii-machine/).
#' A short Youtube video will help you to understand how this function can be employed in conjunction with Swell form machine: https://www.youtube.com/watch?v=ClI555l4Z1M

#' @return Nothing within the R session, but a pdf file will be created in the user's working directory.

#' @examples

#' ```{r, echo=TRUE}
#' BRL.begin(file='tactile.pdf', pt=11, paper='special', font='BRL')
#' hist(airquality$Ozone)
#' BRL.end()
#' # The braille ready-to-print pdf version will be created in your working directory. Print it out and run the swell touch paper through swell form heating machine.
#' ```

#' @author JooYoung Seo

#Function starts
BRL.end <-
function() {

# Body code Starts here
showtext::showtext.end()
dev.off()

# Body code ends
}
#Function Ends
