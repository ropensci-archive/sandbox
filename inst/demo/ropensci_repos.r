# For all ropensci repos
install_github("sandbox", "ropensci")

library(sandbox); library(httr); library(ggplot2); library(scales); library(reshape2); library(bipartite)
github_auth()
ropensci_repos <- github_allrepos(userorg = 'ropensci')
library(doMC)
registerDoMC(cores=4)
github_commits_safe <- plyr::failwith(NULL,github_commits)
out <- llply(ropensci_repos, function(x) github_commits_safe("ropensci", x, since='2009-01-01T', limit=500), .parallel=TRUE)

names(out) <- ropensci_repos
out2 <- compact(out)
outdf <- ldply(out2)

# make interaction network of committers and repos
outdf_network <- droplevels(outdf[!outdf$.id %in% c("citeulike","challenge","docs","ropensci-book","usecases","textmine","usgs","ropenscitoolkit","retriever"),])
outdf_network <- droplevels(outdf_network[!outdf_network$name %in% "whoknowshit",])
outdf_network <- droplevels(outdf_network[outdf_network$variable %in% "additions",])
casted <- dcast(outdf_network, .id + date + name ~ variable, fun.aggregate=length, value.var="value")
names(casted)[1] <- "repo"
head(casted)

casted2 <- ddply(casted, .(repo, name), summarise, commits=sum(additions))
head(casted2)

library(picante)
casted2 <- data.frame(repo=casted2$repo, weight=casted2$commits, name=casted2$name)
mat <- sample2matrix(casted2)

plotweb(mat, method="cca", text.rot=45, ad.high=c(0,2), ad.low=c(1.2,0))

# visualize additions and deletions through time for each repo
outdf_subset <- outdf[outdf$name %in% c("cboettig","SChamberlain","karthikram","EDiLD","dwinter","emhart","rmaia","DASpringate"), ]
outdf_subset <- outdf_subset[!outdf_subset$.id %in% c("citeulike","challenge","docs","ropensci-book","usecases","textmine","usgs","ropenscitoolkit"),]
outdf_subset$.id <- tolower(outdf_subset$.id)

# p <- 
ggplot(outdf_subset, aes(date, value, colour=name)) + 
	geom_line() + 
	scale_x_date(labels = date_format("%Y"),breaks = date_breaks("year")) + 
	scale_y_log10() +
	scale_colour_brewer(type="qual", palette=6) +
	facet_grid(.id ~ variable) + 
	labs(x="", y="") + 
	theme(axis.text.y=element_blank(), axis.ticks.y=element_blank(),
		strip.text.y=element_text(angle=0, size=8), panel.grid.major=element_blank(),
		panel.grid.minor=element_blank(),
		legend.text=element_text(size = 8))