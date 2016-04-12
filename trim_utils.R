# trim_seq: 

trim_seq <- function(seq){
  
  begin = TRUE
  end = TRUE
  begin_index = 1
  end_index = length(seq)
  len = length(seq)
  
  for(i in 1:length(seq)){
    
    if((seq[i] == "n" || seq[i] == "?") && begin == TRUE){
      begin_index = begin_index + 1
    } else {
      begin = FALSE
    }
    
    if((seq[len + 1 - i] == "n" || seq[len + 1 - i] == "?") && end == TRUE){
      end_index = end_index - 1
    } else {
      end = FALSE
    }
    
    if(begin == FALSE && end == FALSE){
      break
    }
    
  }
  
  return(seq[begin_index:end_index])
  
}

# check_seqs: 

check_seq <- function(seq){
  
  len = length(seq)
  numNs = sum(seq == "n")
  numQs = sum(seq == "?")
  
  res = ifelse((numNs + numQs) == len, FALSE, TRUE)
  
  return(res)
  
}