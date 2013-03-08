library(httr)
stack_auth <- function(client_id = NULL)
{
	# url <- "https://stackexchange.com/oauth/dialog"
	# if(!is.null(client_id)) {client_id=client_id} else {client_id = getOption("stack_client_id", stop("Missing StackExchange client id"))}
	# scope <- "no_expiry,private_info"
	# redirect_uri <- "https://github.com/ropensci/raltmet"
	# args <- compact(list(client_id=client_id, scope=scope, redirect_uri=redirect_uri))
	# content(GET(url, query=args))

	BROWSE("https://stackexchange.com/oauth/dialog?client_id=1220&scope=no_expiry,private_info&redirect_uri=https://github.com/ropensci/raltmet")

	if(!is.null(client_secret)) {client_secret=client_secret} else {client_secret = getOption("twothreesecret", stop("Missing Github client secret"))}
	if(!exists("stack_sign")){
		stack_app <- oauth_app("stack", key=client_id, secret=client_secret)
		stack_urls <- oauth_endpoint(NULL, "authorize", "access_token", base_url = "https://stackexchange.com/oauth/dialog")
		stack_token <- oauth2.0_token(stack_urls, stack_app)
		stack_sign <- httr::sign_oauth2.0(stack_token$access_token)
		assign('stack_sign', stack_sign, envir=sandbox:::StackAuthCache)
		message("\n Stackexchange authentication was successful \n")
		invisible(stack_sign)
	} else { NULL }
}
# stack_auth()

redirect_uri="https://stackexchange.com/oauth/login_success"
response_type="code"
basic="basic"