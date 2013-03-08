# sandbox #

Install using install_github within Hadley's devtools package.

```R
install.packages("devtools")
require(devtools)
install_github("sandbox", "ropensci")
require(sandbox)
```

A set of functions to play around with various web data sources:

* [GitHub](http://github.com/) - [API documentation](http://developer.github.com/) - Get metrics on code repositories, including forks, watchers, and open issues. 
* [Stackoverflow](http://stackoverflow.com/) - [API documentation](https://api.stackexchange.com/docs) - Get reputation score(s) on a single or many user ID(s).
	* [stackexchange authentication](https://api.stackexchange.com/docs/authentication)
	* [my R app - stacker](http://stackapps.com/apps/oauth/view/1220)