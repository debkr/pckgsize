howbigismypackage
========================================================

howbigismypackage is an R package that counts the total number of lines of R code in an R package. It counts every line of every file with a `.R` or `.r` extension in the `R/` directory the specified package, excluding comments and blank lines. The package must be source code and not a binary (i.e. there must be R scripts in the `R/` directory.)

Install howbigismypackage:

```
library(devtools)
install_github("ncarchedi/howbigismypackage")
```

Example use: 

```
library(howbigismypackage)
how_big_is_my_package("~/Dropbox/R_Working_Directory/swirl")
```