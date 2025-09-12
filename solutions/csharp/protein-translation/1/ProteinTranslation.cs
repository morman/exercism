using System;

// add dictonary 
using System.Collections.Generic; 
// add regex
using System.Text.RegularExpressions;

public static class ProteinTranslation
{
    public static string[] Proteins(string strand)
    {
        // initialize list of translated codons
        var translated = new List<string>();

        // create dictionary of proteins indexed by codon
        Dictionary<string, string> proteins = new Dictionary<string, string>();
        // add each codon and its associated protein
        // Methionine codon
        proteins.Add("AUG", "Methionine");
        // Phenylalanine codons
        proteins.Add("UUU", "Phenylalanine");
        proteins.Add("UUC", "Phenylalanine");
        // Leucine codons 
        proteins.Add("UUA", "Leucine");
        proteins.Add("UUG", "Leucine");
        // Serine codons    
        proteins.Add("UCU", "Serine");
        proteins.Add("UCC", "Serine");
        proteins.Add("UCA", "Serine");
        proteins.Add("UCG", "Serine"); 
        // Tyrosine codons
        proteins.Add("UAU", "Tyrosine"); 
        proteins.Add("UAC", "Tyrosine");                                           
        // Cysteine codons
        proteins.Add("UGU", "Cysteine"); 
        proteins.Add("UGC", "Cysteine");         
        // Tryptophan codon
        proteins.Add("UGG", "Tryptophan");    
        // STOP codons
        proteins.Add("UAA", "STOP");
        proteins.Add("UAG", "STOP");
        proteins.Add("UGA", "STOP");

        // define codon pattern to match
        string pattern = @"\w\w\w"; 
        // build pattern matcher   
        Regex regex = new Regex(pattern);  

        // split strand and attempt to match to dictionary
        foreach(Match match in regex.Matches(strand)) {
            // if we've received a codon that translates to a STOP then break out
            if (proteins[match.Value].Equals("STOP")) {
                break;
            } else {
                // otherwise append to the list the codon match value from dictionary
                translated.Add(proteins[match.Value]);
            }
        }

        // send translated list cast to an array back to caller
        return translated.ToArray();
    }
}