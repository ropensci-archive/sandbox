# getURL("http://total-impact-core.herokuapp.com/v1")
# 
# getURL("http://total-impact-core.herokuapp.com/tiid/doi/10.1371/journal.pcbi.1000361")
# fromJSON(getURL("http://total-impact-core.herokuapp.com/item/1b2f4fc2bea711e1bdf912313d1a5e63"), simplify=T)
# 
# 
# 
# require(RCurl); require(stringr); require(RJSONIO)
# foo <- function(url, sleep) {
#   tt <- getURL(url)
#   token <- str_extract(tt[[1]], "[a-z0-9]+")
#   message("Pausing a bit for the query to finish...")
#   Sys.sleep(time = sleep)
#   fromJSON(
#     getURL(
#       paste("http://total-impact-core.herokuapp.com/item/", token, sep='')))
# }
# myurl <- "http://total-impact-core.herokuapp.com/tiid/doi/10.1371/journal.pcbi.1000361"
# sleeptime <- 4
# foo(myurl, sleeptime)
# 
# tryCatch()