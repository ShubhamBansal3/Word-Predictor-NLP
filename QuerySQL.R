QueryStringLevel1 <- function(input1,  limit = 5){
  
  
  q1 <- paste ("SELECT * FROM ", "Bigrams", " WHERE ",
               "Key1 LIKE '", input1,"'",
               sep = "", collapse = NULL)
  
  q1 <- paste (q1,
               " ORDER BY Weight ASC ",
               " LIMIT ", limit,
               sep = "",
               collapse = NULL)
  q1
}

QueryStringLevel2 <- function(input1, input2 = NULL, limit = 5){
  
  
  q2 <- paste ("SELECT * FROM ", "Trigrams", " WHERE ",
               "Key2 LIKE '", input1,"'",
               sep = "", collapse = NULL)
  
  if(!is.null(input2)){
    q2 <- paste (q2,
                 " AND Key1 LIKE '", input2,"'",
                 sep = "", collapse = NULL)
  }
  
  q2 <- paste (q2,
               " ORDER BY Weight ASC ",
               " LIMIT ", limit,
               sep = "",
               collapse = NULL)
  q2
}


QueryStringLevel3 <- function(input1, input2=NULL,input3=NULL, limit = 5)
{
  
  q3 <- paste ("SELECT * FROM ", "Fourgrams", " WHERE ",
               "Key3 LIKE '", input1,"'",
               sep = "", collapse = NULL)
  
  if(!is.null(input2)){
    q3 <- paste (q3,
                 " AND Key2 LIKE '", input2,"'",
                 sep = "", collapse = NULL)
  }
  if(!is.null(input3)){
    q3 <- paste (q3,
                 " AND Key1 LIKE '", input3,"'",
                 sep = "", collapse = NULL)
  }
  q3 <- paste (q3,
               " ORDER BY Weight ASC ",
               " LIMIT ", limit,
               sep = "",
               collapse = NULL)
  q3
}
