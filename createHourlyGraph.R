#!/usr/bin/Rscript --slave
library(ggplot2)
argv <- commandArgs(TRUE)
# y <- as.character(argv[5]) # e.g. NumMentions
# colour <- as.character(argv[4]) # e.g. Provider
title <- as.character(argv[3]) # title of the graph e.g. "GSTB Mail Providers 23June2011"
xlabel <- as.character(argv[2]) # x-axis label e.g. "23June2011" 
tblFileName <- as.character(argv[1])
tbl <- read.csv(tblFileName)
tbl$Hour <- strptime(tbl$Hour,"%Y%m%d%H")
myplot <- ggplot(data=tbl,aes(x=as.POSIXct(Hour),y=NumMentions,colour=Provider)) +
  geom_line() +geom_point()+theme_bw(base_size=8) + xlab(xlabel) + ylim(0, 25) + opts(title = title)
outputFilename = sub("csv", "png",tblFileName)
ggsave(myplot,filename=outputFilename,scale=1.5)
