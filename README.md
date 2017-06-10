# tactileR
R package for creating tactile graphics for users with visual impairments.

## Description
Just surround any graphic object between two functions BRL.begin() and BRL.end(). The graph will be created in PDF format in your current directory, with all text being presented using  a braille font. See more details in the example section below.

## Arguments
 Argument | Description 
 ---------- | ---------- 
| file | A character string giving the filename where the image is to be saved. The default file name is "tactile.pdf" if not given. |
| pt | Numeric value specifying braille font size for a created file. Default is 11. |
| paper | Character value setting paper size of output pdf file. Default is "special". |
| font | Character value for font family. Available options include "BRL" for "BRAILLE1.ttf" (Braille Normal) and "SWL" for "Swell-Braille.ttf" (Swell Braille), and "TIMES" for "times.ttf" (Times New Roman). Default is set to "BRL". |

## Details
*Note*: This function optimizes for both 11*11 and 11*8.5 swell touch papers. When printing a generated braille pdf, just remember two things:
1. check "Fit" in the print dialog box (the shortcut key is ALT+F).
2. Check "Landscape" in the print dialog box as well.
- For boxplot, you do not need to check the "Landscape," just leave it as a "Portray." However, please check the "Fit" all the time.

## Information
- If you are not familiar with what swell form machine is, please refer to [this web site](http://www.americanthermoform.com/product/swell-form-graphics-ii-machine/).
- A short Youtube video will help you to understand how this function can be employed in conjunction with Swell form machine: https://www.youtube.com/watch?v=ClI555l4Z1M

## Return
Nothing within the R session, but a pdf file will be created in the user's working directory.

## Examples

### Histogram
```{r ex1, echo=TRUE}
# tactileR package has not yet been submitted to CRAN. You need to install it via github.
## Make sure you have installed devtools package.
install.packages('devtools')

# Install tactileR package:
devtools::install_github('sjystu/tactileR')

# Loading tactile package:
library(tactileR)

# Create tactile graphic by surrounding between two functions like below. The arguments used in this example are all given by default:
BRL.begin(file='tactile.pdf', pt=11, paper='special', font='BRL')
hist(airquality$Ozone)
BRL.end()
# The braille ready-to-print pdf version will be created in your working directory. Print it out and run the swell touch paper through swell form heating machine.
```

### Boxplot
```{r ex2, echo=TRUE}
library(tactileR)

x <- rnorm(100)
BRL.begin('test.pdf')
boxplot(x)
BRL.end()
# The braille ready-to-print pdf version will be created in your working directory. Print it out and run the swell touch paper through swell form heating machine.
```

*Note*: Histogram and boxplot are just examples. You can feed any graphic object through the functions. barplot, interaction plot, regression plot, network graph, wordcloud, etc.

## Author
[JooYoung Seo](Mailto:jooyoung@psu.edu)

## Limitation
Currently this package does not support braille translation. This means you cannot embed any special symbols, math symbols, contracted braille, and non-roman alphabet characters. This issue will be addressed later by employing Liblouis translator.