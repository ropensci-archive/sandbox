# raltmet #

Install using install_github within Hadley's devtools package.

```R
install.packages("devtools")
require(devtools)
install_github("raltmet", "rOpenSci")
require(raltmet)
```

This set of functions/package will access altmetics data from various provides, including:

* [CitedIn](http://citedin.org/) - [API documentation](http://citedin.org/)
* [TotalImpact](http://totalimpact.org/) - [API documentation](http://total-impact.org/about#toc_2_16)
* [CiteULike](http://www.citeulike.org/) - API documentation (anyone know where?)
* [Altmetrics](http://www.altmetric.com/index.php) - [API documentation](http://api.altmetric.com/)