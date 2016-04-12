# trim_seq: 

trim_seq <- function(seq){
  begin = TRUE
  end = TRUE
  begin_index = 1
  end_index = length(seq)
  len = length(seq)
  
  for(i in 1:length(seq)){
    
    if((seq[i] == "n" || seq[i] == "?") && begin == TRUE){
      begin_index = begin_index + 1;
    } else {
      begin = FALSE;
    }
    
    if((seq[len + 1 - i] == "n" || seq[len + 1 - i] == "?") && end == TRUE){
      end_index = end_index - 1;
    } else {
      end = FALSE;
    }
    
    if(begin == FALSE && end == FALSE){
      break;
    }
    
  }
  
  return(seq[begin_index:end_index])
  
}

# trim_Nds: 

trim_Nds <- function(in_fasta_file, out_fasta_file){

  in_seqs <- ape::read.dna(in_fasta_file,
                           format="fasta",
                           as.character=T)

  out_seqs <- lapply(in_seqs, trim_seq)

  nonzero <- lapply(out_seqs, length) != 0

  nonzero_outseqs <- lapply(out_seqs[nonzero],
                            function(v) toupper(v))

  ape::write.dna(nonzero_outseqs, out_fasta_file, format="fasta",
                 nbcol=8, colsep="", colw=10)

}
