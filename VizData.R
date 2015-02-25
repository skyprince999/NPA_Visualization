require(googleVis)
require(xlsx)

# Read datafile

bank_data<-read.xlsx("datafile.xlsx",1,header=TRUE,colClasses=c("character","character","Date","double","double","double","double","double"))

# Create a google Motionchart using the above data
M=gvisMotionChart(data=bank_data,idvar="Bank.Name",timevar="Quarter",
                  xvar="Net.NPA",yvar="RoA",colorvar="Private.Public",
                  sizevar="Net.Profit",
                  options=list(vAxes="[{viewWindowMode:'explicit',
  		viewWindow:{min:-0.01, max:0.025}}]",title="NPA Visualization of Indian Banks"),
                  chartid="NPAViz",)
plot(M)
# The gvis object is unlisted and stored in an html file
# The html file can be uploaded to a blog site like Blogger or Google Sites
cat(unlist(M$html),file="NPAViz.html")

# The above file was uploaded to my blog 
# http://www.theshoeshineboy.in/2015/02/npa-visualization-for-indian-banks.html

#For creating Google gadgets
#cat(createGoogleGadget(M), file="myGadget.xml")
