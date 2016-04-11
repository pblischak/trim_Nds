#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
CharacterVector trim_Nds_cpp(CharacterVector seq) {
  
  CharacterVector out_seq;
  int len = seq.length();
  int begin_index = 0, end_index = len - 1;
  bool begin = TRUE, end = TRUE;

  for(int i = 0; i < len; i++){
    
    if((seq[i] == "n" || seq[i] == "?") && begin == TRUE){
      begin_index++;
    } else {
      begin = FALSE;
    }
      
    if((seq[len - i - 1] == "n" || seq[len - i - 1] == "?") && end == TRUE){
      end_index--;
    } else {
      end = FALSE;
    }
    
    if(begin == FALSE && end == FALSE){
      break;
    }
    
  }
  
  for(int j = begin_index; j <= end_index; j++){
    out_seq.push_back(seq[j]);
  }
  
  return out_seq;
  
}