PredictionResult<- function(input1,input2,input3,length) {
  source("QuerySQL.R", local = TRUE)
  
  Output<- character()
  
  if(length>=3)
  {
    q3<- QueryStringLevel3(input1,input2,input3)
    Result <- dbGetQuery(db, q3)
    Output<- Result$Key4
    Output
  }
  
  if(length==2|length(Output)==0)
  {
    q2<- QueryStringLevel2(input1,input2)
    Result <- dbGetQuery(db, q2)
    Output<- Result$Key3
    Output
  }
  
  if(length==1|length(Output)==0)
  {
    q1<- QueryStringLevel1(input1)
    Result <- dbGetQuery(db, q1)
    Output<- Result$Key2
    Output
  }
  Output
}