require(googleVis)
require(xlsx)

#Read datafile
#setwd("D:/NPA in Banking Sector")
bank_data<-read.xlsx("datafile.xlsx",1,header=TRUE,colClasses=c("character","character","Date","double","double","double","double","double"))

#Motionchart the data
M=gvisMotionChart(data=bank_data,idvar="Bank.Name",timevar="Quarter",
                  xvar="Net.NPA",yvar="RoA",colorvar="Private.Public",
                  sizevar="Net.Profit",
                  options=list(vAxes="[{viewWindowMode:'explicit',
  		viewWindow:{min:-0.01, max:0.025}}]",title="NPA Visualization of Indian Banks"),
                  chartid="NPAViz",)
plot(M)

cat(unlist(M$html),file="NPAViz.html")

#For creating Google gadgets
#cat(createGoogleGadget(M), file="myGadget.xml")