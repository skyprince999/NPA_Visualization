setwd("D:/NPA in Banking Sector")
require(xlsx)
output<-data.frame()
sheets<-list()
for(i in 1:14){
  sheets[[i]]<-read.xlsx("Private Banks_1.xlsx",i)
  bankName<-rep(names(sheets[[i]])[1],18)
  privatePublic<-rep("Private",18)
  quarters<-t(rev(sheets[[i]][6,(2:19)]))
  bank_data<-t(rev(sheets[[i]][c(26,43:45,47),(2:19)]))
  #Append all data
  output<-rbind(output,cbind(bankName,privatePublic,quarters,bank_data))
  
}

for(i in 1:13){
  sheets[[i]]<-read.xlsx("Public Banks_1.xlsx",i)
  bankName<-rep(names(sheets[[i]])[1],18)
  privatePublic<-rep("Public",18)
  #quarters<-t(rev(sheets[[i]][6,(2:19)]))
  bank_data<-t(rev(sheets[[i]][c(26,43:45,47),(2:19)]))
  #Append all data
  output<-rbind(output,cbind(bankName,privatePublic,quarters,bank_data))
  
}

for(i in 1:11){
  sheets[[i]]<-read.xlsx("Public Banks_2.xlsx",i)
  bankName<-rep(names(sheets[[i]])[1],18)
  privatePublic<-rep("Public",18)
  #quarters<-t(rev(sheets[[i]][6,(2:19)]))
  bank_data<-t(rev(sheets[[i]][c(26,43:45,47),(2:19)]))
  #Append all data
  output<-rbind(output,cbind(bankName,privatePublic,quarters,bank_data))
  
}

colnames(output)<-c("Bank.Name","Private.Public","Quarter","Net.Profit","Gross.NPA","Net.NPA","RoA","No.Of.Shares")
rm(bankName,i,privatePublic,bank_data,quarters)
write.xlsx(output,"datafile.xlsx")