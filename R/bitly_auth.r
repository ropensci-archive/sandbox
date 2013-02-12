#' Authenticate with github
#' @import httr
#' @examples \dontrun{
#' bitly_auth()
#' }
#' @export
bitly_auth <- function(client_id = NULL, client_secret = NULL)
{
	if(!is.null(client_id)) {client_id=client_id} else 
		{client_id = getOption("bitly_client_id")}
	if(!is.null(client_secret)) {client_secret=client_secret}  else 
		{client_secret = getOption("bitly_client_secret")}
	if(!exists("bitly_sign")){
		bitly_app <- oauth_app("bitly", key=client_id, secret=client_secret)
		bitly_urls <- oauth_endpoint(NULL, "authorize", "access_token", base_url = "https://api-ssl.bitly.com")
		bitly_token <- oauth2.0_token(bitly_urls, bitly_app)
		bitly_sign <- sign_oauth2.0(bitly_token$access_token)
	} else { NULL }
	# url = "https://api-ssl.bitly.com/oauth/access_token"
	# POST(url, userpwd = "schamberlain:rUQH4KL1)DlJe(bF")
	# postForm(url, curl="schamberlain:rUQH4KL1)DlJe(bF")
}