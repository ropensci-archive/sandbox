# raltmet #

Install using install_github within Hadley's devtools package.

```R
install.packages("devtools")
require(devtools)
install_github("raltmet", "ropensci")
require(raltmet)
```

This set of functions/package will access altmetics data from the following:

* [CitedIn](http://citedin.org/) - [API documentation](http://citedin.org/) 
* [TotalImpact](http://total-impact.org/) - [API documentation](http://total-impact.org/api-docs) - Gets various metrics, including Mendeley readers, tweets, blogging mentions, etc.
* [CiteULike](http://www.citeulike.org/) - API documentation (anyone know where?) - Gets CiteULike bookmarks of papers.
* [Altmetric.com](http://www.altmetric.com/index.php) - [API documentation](http://api.altmetric.com/) - Gets tweet mentions of papers.
* [GitHub](http://github.com/) - [API documentation](http://developer.github.com/) - Get metrics on code repositories, including forks, watchers, and open issues. 
* [Bit.ly](https://bitly.com/) - [API documentation](http://dev.bitly.com/) - Get clicks on bit.ly short URLs and shorten long URLs - further functions to come. 
* [G+](https://plus.google.com/) - [API documentation](https://developers.google.com/+/) - Get user posts, comments, search terms, etc.  
* [Digg](http://digg.com/) - [API documentation](http://developers.digg.com/documentation) - Get metrics on Digg users, including diggs, comments, followers, following, and submissions.  
* [Stackoverflow](http://stackoverflow.com/) - [API documentation](https://api.stackexchange.com/docs) - Get reputation score(s) on a single or many user ID(s).  
* [Disqus](http://disqus.com/) - [API documentation](http://disqus.com/api/docs/) -  Get metrics on comments on posts, etc.