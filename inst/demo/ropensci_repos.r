# For all ropensci repos
# install_github("sandbox", "ropensci")

library(sandbox); library(httr); library(ggplot2); library(scales); library(reshape2); library(bipartite); library(doMC); library(plyr)
# github_auth()
ropensci_repos <- github_allrepos(userorg = 'ropensci')

registerDoMC(cores=4)
github_commits_safe <- plyr::failwith(NULL,github_commits)
out <- llply(ropensci_repos, function(x) github_commits_safe("ropensci", x, since='2009-01-01T', limit=500), .parallel=TRUE)

# xxx<-github_commits_safe("ropensci", ropensci_repos[[1]], since='2009-01-01T', limit=500)
# xxx<-github_commits("ropensci", "rfigshare", since='2009-01-01T', limit=10)

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
# plotweb(mat, text.rot=30, adj.high=c(-0.2,2), adj.low=c(1.2,-0.2))
plotweb(sortweb(mat, sort.order="dec"), method="normal", text.rot=30, 
	adj.high=c(-0.2,2), adj.low=c(1.2,-0.2), y.width.low=0.05, y.width.high=0.05,
	ybig=0.09)
# plotweb(mat, method="cca", text.rot=45, adj.high=c(0,2), adj.low=c(1.2,0))


# visualize additions and deletions through time for each repo
outdf_subset <- outdf[outdf$name %in% 
	c("cboettig","SChamberlain","karthikram","EDiLD","dwinter","emhart","rmaia","DASpringate"), ]
outdf_subset <- outdf_subset[!outdf_subset$.id %in% c("citeulike","challenge","docs",
	"ropensci-book","usecases","textmine","usgs","ropenscitoolkit","neotoma","rEWDB","rgauges",
	"rodash","ropensci.github.com","ROAuth"),]
outdf_subset$.id <- tolower(outdf_subset$.id)
outdf_subset <- ddply(outdf_subset, .(.id,date,name,variable), summarise, value=sum(value)) # sum by date

# ggplot(outdf_subset, aes(date, value, fill=name, colour=name)) + 
# 	# geom_point(size=1.5) +
# 	geom_density(stat='identity', alpha=0.6, size=0) +
# 	scale_x_date(labels = date_format("%Y"), breaks = date_breaks("year")) + 
# 	scale_y_log10() +
# 	scale_fill_brewer(type="qual", palette=3, name="Committer") +
# 	facet_grid(.id ~ variable) + 
# 	labs(x="", y="") + 
# 	theme(axis.text.y=element_blank(), 
# 		axis.text.x=element_text(colour="black"), 
# 		axis.ticks.y=element_blank(),
# 		strip.text.y=element_text(angle=0, size=8), 
# 		panel.grid.major=element_blank(),
# 		panel.grid.minor=element_blank(),
# 		legend.text=element_text(size = 8), 
# 		panel.background = element_rect(fill = "white", colour = NA)) +
# 	guides(colour='none')

# ggplot(outdf_subset[outdf_subset$.id=='elife',], aes(date, value, colour=name)) + 
# 	# geom_point(size=1.5) +
# 	geom_density(stat='identity') +
# 	scale_x_date(labels = date_format("%Y"), breaks = date_breaks("year")) + 
# 	scale_y_log10() +
# 	scale_colour_brewer(type="qual", palette=3, name="Committer") +
# 	facet_grid(.id ~ variable) + 
# 	labs(x="", y="") + 
# 	theme(axis.text.y=element_blank(), 
# 		axis.text.x=element_text(colour="black"), 
# 		axis.ticks.y=element_blank(),
# 		strip.text.y=element_text(angle=0, size=8), 
# 		panel.grid.major=element_blank(),
# 		panel.grid.minor=element_blank(),
# 		legend.text=element_text(size = 8), 
# 		panel.background = element_rect(fill = "black", colour = NA)) +
# 	guides(colour=guide_legend(override.aes = list(size = 3)))

########
## plot new style
# outdf_subset_2 <- ddply(outdf_subset, .(.id,date,name), summarise, value=sum(value))

# ggplot(outdf_subset_2, aes(date, value, fill=name)) +
# 	geom_bar(stat='identity') +
# 	theme_bw() +
# 	# geom_density(stat='identity', alpha=0.6, size=0) +
# 	scale_x_date(labels = date_format("%Y"), breaks = date_breaks("year")) + 
# 	scale_y_log10() +
# 	# scale_fill_brewer(type="qual", palette=3, name="Committer") +
# 	facet_wrap(~.id) + 
# 	labs(x="", y="") + 
# 	theme(axis.text.y=element_blank(), 
# 		axis.text.x=element_text(colour="black"), 
# 		axis.ticks.y=element_blank(),
# 		strip.text.y=element_text(angle=0, size=8), 
# 		panel.grid.major=element_blank(),
# 		panel.grid.minor=element_blank(),
# 		legend.text=element_text(size = 8))

outdf_subset_3 <- ddply(outdf_subset, .(.id,date), summarise, value=sum(value))
mindates <- llply(unique(outdf_subset_3$.id), function(x) min(outdf_subset_3[outdf_subset_3$.id==x,"date"]))
names(mindates) <- unique(outdf_subset_3$.id)
mindates <- sort(do.call(c, mindates))
outdf_subset_3$.id <- factor(outdf_subset_3$.id, levels=names(mindates))

ggplot(outdf_subset_3, aes(date, value, fill=.id)) +
	geom_bar(stat='identity', width=0.5) +
	geom_rangeframe(sides="b",colour="grey") +
	theme_bw() +
	scale_x_date(labels = date_format("%Y"), breaks = date_breaks("year")) + 
	scale_y_log10() +
	facet_grid(.id ~ .) + 
	labs(x="", y="") + 
	theme(axis.text.y=element_blank(), 
		axis.text.x=element_text(colour="black"), 
		axis.ticks.y=element_blank(),
		strip.text.y=element_text(angle=0, size=8, ),
		strip.background = element_rect(size=0), 
		panel.grid.major=element_blank(),
		panel.grid.minor=element_blank(),
		legend.text=element_text(size = 8),
		legend.position="none",
		panel.border = element_blank())