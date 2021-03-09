corr <- function(directory, threshold=0){
	omega <- complete(directory)
	z <- omega[[nobs]]
	k <- c()
	for (i in z){
		l<-i>threshold
		k<-c(k,l)
	}
	k
	omega$valid<-k
	y <- subset(omega, valid == TRUE)
	m<-y[[id]]
	n<-c()
	for (i in m){
		ix <- formatC(i, width = 3, flag = "0")
		pathway <- paste(getwd(), "/", directory, "/", ix, ".csv", sep ="")
		ab <- read.csv(pathway)
		a<- ab[["sulfate"]]
		b<- ab[["nitrate'']]
		d<- cor(a,b)
		n<-c(n,d)
		}
	n
	monitor_id <-m
	correlation_coefficient <- n
	correlation_matrix <- data.frame(monitor_id,correlation_coefficient)
	correlation_matrix
	}
