# `raltmet`

Another option to install is install_github within Hadley's devtools package.

```R
install.packages("devtools")
require(devtools)
install_github("raltmet", "rOpenSci")
require(raltmet)
```

This set of functions/package will access altmetics data from various provides, including:

* [CitedIn](http://citedin.org/)
* [TotalImpact](http://totalimpact.org/)
* [CiteULike](http://www.citeulike.org/)
* [Altmetrics](http://www.altmetric.com/index.php)