module ProteinTranslation

// give codon from RNA string, match on a known codon, translating to protein, or STOP instruction
let translate codon =
    match codon with
        // Methionine codon
        | "AUG" -> "Methionine"
        // Phenylalanine codons
        | "UUU" 
        | "UUC" -> "Phenylalanine"
         // Leucine codons   
        | "UUA"
        | "UUG" -> "Leucine"
        // Serine codons          
        | "UCU" 
        | "UCC" 
        | "UCA"
        | "UCG" -> "Serine"
        // Tyrosine codons 
        | "UAU"
        | "UAC" -> "Tyrosine"
        // Cysteine codons
        | "UGU" 
        | "UGC" -> "Cysteine"
        // Tryptophan codon
        | "UGG" -> "Tryptophan"
        // STOP codons
        | "UAA" 
        | "UAG" 
        | "UGA" -> "STOP"
        // complain if codon is unknown (there are 47 more!) and cannot be translated 
        | _ -> failwith "Codon unknown: cannot translate to protein"

// given RNA strand, extract codons, translate to proteins, and STOP if found, then cast to list
let proteins (rna:string) =
    rna 
        // pipeline RNA string to 3 character codon sequences
        |> Seq.chunkBySize 3
        // pipeline to map codon chunks to protein translation function
        |> Seq.map(System.String >> translate)
        // pipeline to keep taking proteins unless a STOP is encountered
        |> Seq.takeWhile (fun protein -> protein <> "STOP")
        // pipeline to convert sequence of proteins into a list of strings
        |> Seq.toList