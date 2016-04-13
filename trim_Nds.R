# check_seqs: 

check_seq <- function(seq){
  
  len = length(seq)
  numNs = sum(seq == "n")
  numQs = sum(seq == "?")
  
  res = ifelse((numNs + numQs) == len, FALSE, TRUE)
  
  return(res)
  
}

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

# trim_Nds: 

trim_Nds <- function(in_fasta_file, out_fasta_file){

  # Read in fasta file
  in_seqs <- ape::read.dna(in_fasta_file,
                           format="fasta",
                           as.character=T)
  
  # check for sequences that only have N's or ?'s and remove
  good_seqs <- lapply(in_seqs, check_seq)
  seqs_to_trim <- in_seqs[as.logical(good_seqs)]
  
  # trim sequences
  out_seqs <- lapply(seqs_to_trim, trim_seq)

  # change letters to upper case
  upper_out_seqs <- lapply(out_seqs, toupper)

  # write output file with 80 characters per line
  ape::write.dna(upper_out_seqs, out_fasta_file, format="fasta",
                 nbcol=8, colsep="", colw=10)

}
