
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tactileR: R package for creating tactile graphics for users with visual impairments.

[![License: GPL
v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](http://www.gnu.org/licenses/gpl-3.0)
<!-- badges: start --> [![Travis build
status](https://travis-ci.org/jooyoungseo/tactileR.svg?branch=master)](https://travis-ci.org/jooyoungseo/tactileR)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/jooyoungseo/tactileR?branch=master&svg=true)](https://ci.appveyor.com/project/jooyoungseo/tactileR)
[![Codecov test
coverage](https://codecov.io/gh/jooyoungseo/tactileR/branch/master/graph/badge.svg)](https://codecov.io/gh/jooyoungseo/tactileR?branch=master)
[![CRAN
status](https://www.r-pkg.org/badges/version/tactileR)](https://cran.r-project.org/package=tactileR)
<!-- badges: end -->

## Description

Just surround any graphic object between two functions `brl_begin()` and
`brl_end()`. The graph will be created in PDF format in your current
directory, with all text being presented using a braille font. See more
details in the example section below.

## Installation

### Development Version

You can install the latest development version as follows:

``` r
if(!require(devtools)) {
install.packages("devtools")
}

devtools::install_github('jooyoungseo/tactileR')
```

### Stable Version

You can install the released version of tactileR from
[CRAN](https://CRAN.R-project.org)
with:

``` r
install.packages("tactileR")
```

## Arguments

| Argument |                                                                                                           Description                                                                                                           |
| :------- | :-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| file     |                                                   A character string giving the filename where the image is to be saved. The default file name is “tactile.pdf” if not given.                                                   |
| pt       |                                                                          Numeric value specifying braille font size for a created file. Default is 11.                                                                          |
| paper    |                                                                          Character value setting paper size of output pdf file. Default is “special”.                                                                           |
| font     | Character value for font family. Available options include “BRL” for “BRAILLE1.ttf” (Braille Normal) and “SWL” for “Swell-Braille.ttf” (Swell Braille), and “TIMES” for “times.ttf” (Times New Roman). Default is set to “BRL”. |

## Details

*Note*: This function optimizes for both 11*11 and 11*8.5 swell touch
papers. When printing a generated braille pdf, just remember two things:

1.  check “Fit” in the print dialog box (the shortcut key is ALT+F).
2.  Check “Landscape” in the print dialog box as well.

<!-- end list -->

  - For boxplot, you do not need to check the “Landscape,” just leave it
    as a “Portray.” However, please check the “Fit” all the time.

## Information

  - If you are not familiar with what swell form machine is, please
    refer to [this web
    site](http://www.americanthermoform.com/product/swell-form-graphics-ii-machine/).
  - A short [YouTube video](https://www.youtube.com/watch?v=ClI555l4Z1M)
    will help you to understand how this function can be employed in
    conjunction with Swell form machine.

## Return

Nothing within the R session, but a pdf file will be created in the
user’s working directory.

## Examples

### Histogram

``` r
# Loading tactile package:
library(tactileR)

# Create tactile graphic by surrounding between two functions like below. The arguments used in this example are all given by default:
brl_begin(file='tactile.pdf', pt=11, paper='special', font='BRL')
hist(airquality$Ozone)
brl_end()
# The braille ready-to-print pdf version will be created in your working directory. Print it out and run the swell touch paper through swell form heating machine.
```

### Boxplot

``` r
library(tactileR)

x <- rnorm(100)
brl_begin('test.pdf')
boxplot(x)
brl_end()
# The braille ready-to-print pdf version will be created in your working directory. Print it out and run the swell touch paper through swell form heating machine.
```

*Note*: Histogram and boxplot are just examples. You can feed any
graphic object through the functions. barplot, interaction plot,
regression plot, network graph, wordcloud, etc.

## Author

[JooYoung Seo](Mailto:jooyoung@psu.edu)

## Limitation

Currently this package does not support braille translation. This means
you cannot embed any special symbols, math symbols, contracted braille,
and non-roman alphabet characters. This issue will be addressed later by
employing Liblouis translator.
