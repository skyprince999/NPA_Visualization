
require(xlsx)
output<-data.frame()
sheets<-list()
# quarterly data is stored for private & public banks in separate files
# financial information for each bank is stored in a separate sheet
# for loop is used to read the data from different sheets
for(i in 1:38){
  sheets[[i]]<-read.xlsx("Private_Banks_Quarterly.xlsx",i)
  bankName<-rep(names(sheets[[i]])[1],18)
  privatePublic<-rep("Private",18)
  quarters<-t(rev(sheets[[i]][6,(2:19)]))
  bank_data<-t(rev(sheets[[i]][c(26,43:45,47),(2:19)]))
  #Append all data
  output<-rbind(output,cbind(bankName,privatePublic,quarters,bank_data))
  
}

for(i in 1:24){
  sheets[[i]]<-read.xlsx("Public Banks_Quarterly.xlsx",i)
  bankName<-rep(names(sheets[[i]])[1],18)
  privatePublic<-rep("Public",18)
  #quarters<-t(rev(sheets[[i]][6,(2:19)]))
  bank_data<-t(rev(sheets[[i]][c(26,43:45,47),(2:19)]))
  #Append all data
  output<-rbind(output,cbind(bankName,privatePublic,quarters,bank_data))
  
}

colnames(output)<-c("Bank.Name","Private.Public","Quarter","Net.Profit","Gross.NPA","Net.NPA","RoA","No.Of.Shares")
rm(bankName,i,privatePublic,bank_data,quarters)

# Output data is stored in a separate file
# This is then used as an input for the VizData.R program
write.xlsx(output,"datafile.xlsx")
