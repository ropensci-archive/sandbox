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
* [TotalImpact](http://totalimpact.org/) - [API documentation](http://total-impact.org/about#toc_2_16) - Gets various metrics, including Mendeley readers, tweets, blogging mentions, etc.
* [CiteULike](http://www.citeulike.org/) - API documentation (anyone know where?) - Gets CiteULike bookmarks of papers.
* [Altmetric.com](http://www.altmetric.com/index.php) - [API documentation](http://api.altmetric.com/) - Gets tweet mentions of papers.
* [GitHub](http://github.com/) - [API documentation](http://developer.github.com/) - Get metrics on code repositories, including forks, watchers, and open issues. 
* [Bit.ly](https://bitly.com/) - [API documentation](http://code.google.com/p/bitly-api/wiki/ApiDocumentation) - Get clicks on bit.ly short URLs and shorten long URLs - further functions to come. 