#' Search Disqus API.
#'
#' DETAILED DESCRIPTION
#' @import RCurl RJSONIO
#' @param query Search term(s).
#' @param parameter XXXX
#' @param method XXXX
#' @param url The base Disqus url (leave to default).
#' @return json output.
#' @export
#' @examples \dontrun{
#' disqus()
#' }
disqus <- function(query = NA, parameter = NA, method = NA, 
  url = "http://disqus.com/api/3.0",
  key = getOption("natureopensearch", stop("need an API key for the Disqus API")),
  ..., curl = getCurlHandle())
{
  url2 <- paste(url, "/", parameter, '/', method, '.json', sep='')
  args <- list(api_key = key)
  if(!is.na(query))
    args$query <- if(type=='boolean')
    { paste('cql.keywords+', relation, '+', str_replace(query, ',', r2), sep='') } else
    { str_replace(query,',','+') }
  if(!is.na(type))
    args$queryType <- if(type=='search'){'search'} else 
      if(type=='boolean') {'cql'}
  message(paste(url, '?query=', query, '&api_key=', key, '&httpAccept=application/json', sep=''))
  tt <- getForm(url,
    .params = args, 
#     ...,
    curl = curl)
  out <- fromJSON(tt)
  out
}
# http://disqus.com/api/3.0/users/listPosts.json?user=400&api_key=tprqF4g38bVVmow0KWLc416kopRvz6RL0D4zE1Qvmio27PaydQOoWUPZAwfnEVL9#'