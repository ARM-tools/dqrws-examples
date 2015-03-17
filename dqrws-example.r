library("httr")
# Query the web service for the 'sgplssondeC1.c1' datastream, looking up 'rh'
URL <- 'http://www.archive.arm.gov/dqrws/ARMDQR?datastream=sgplssondeC1.c1&varname=rh'
response <- GET(URL)
stop_for_status(response) # exit if status not ‘okay’
timeblocks <- content(response,type="text/csv", header=FALSE, sep="|")
print(timeblocks)

# Read in sample data for this datastream
library(RNetCDF) 
file <- "C:/data/lssonde/sgplssondeC1.c1.20070105.173000.cdf"
nc <- open.nc(file)
dn<-read.nc(nc) # read all data fields into a single list
df<-data.frame(dn) # convert list into a data frame
ta<-dn$base_time[1]+dn$time_offset  # create a time array from (base_time+time_offset)

# compare DQR timeblocks to data time array to see which records should be excluded
mask<-(ta < 0) # create a mask to be used to filter out records
for (iblocks in 1:length(timeblocks)) {
  mask<-mask | (ta >= timeblocks$V1[iblocks] & ta <= timeblocks$V2[iblocks])
}

# set DQR affected records to NA so they are not used
df$rh[mask]<-NA

