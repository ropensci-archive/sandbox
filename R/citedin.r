#' Get CitedIn data for a given PubMed ID.
#' @import RCurl XML plyr
#' @param pmid PubMed ID of the article.
#' @param df print data.frame (TRUE), or list (FALSE - default).
#' @param url The base CitedIn url (should be left to default)
#' @param ... optional additional curl options (debugging tools mostly)
#' @param curl If using in a loop, call getCurlHandle() first and pass 
#'  the returned value in here (avoids unnecessary footprint)
#' @return Data.frame or list of citations of the PubMed ID.
#' @export
#' @examples \dontrun{
#' citedin(15489334, df = TRUE)
#' citedin(15489331)
#' }
citedin <- function(pmid = NA, df = FALSE,
         url = "http://www.citedin.org/webservice.php/citations",
         ...,
         curl = getCurlHandle()){
  args <- list()
  if(!is.na(pmid))
    args$pmid <- pmid
  xx <- getForm(url, 
                .params = args, 
                ..., 
                curl = curl)
  xxx <- gsub(
    paste('\t\n\n\t', paste(rep('\n', 35), collapse=''), sep=''),
       "", xx)
  tt <- xmlToList(xmlTreeParse(xxx))
  func <- function(x){ 
    if(any(sapply(x, is.null)) == TRUE){
      data.frame(x[-(which(sapply(x,is.null),arr.ind=TRUE))]) } else
        {data.frame(x)}
  }
  if(df == TRUE){ldply(tt, func)} else {tt}
}