module ProteinTranslation

let proteins (rna: string) =
    // match on empty
    match rna with
    | "" -> ""