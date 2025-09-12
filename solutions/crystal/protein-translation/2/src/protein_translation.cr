module ProteinTranslation

  def self.proteins(strand : String) : Array(String)
    # initialize array of proteins
    proteins = [] of String

    # convert strand into an array of codons by scanning for 3 chars
    codons = strand.scan(/\w\w\w/)

    # loop over codons, matching based on known protein cases and stop codon "UAA"
    codons.each { |codon|
      puts codon
      # review codon for translation or stop
      case codon.to_s
      when "AUG"
        proteins << "Methionine"
      when "UUU", "UUC"
        proteins << "Phenylalanine"
      when "UUA", "UUG"
        proteins << "Leucine"
      when "UCU", "UCC", "UCA", "UCG"
        proteins << "Serine"
      when "UAU", "UAC"
        proteins << "Tyrosine"
      when "UGU", "UGC"
        proteins << "Cysteine"
      when "UGG"
        proteins << "Tryptophan"
      # TODO: add stop codons to break out of codons.each loop
      when "UAA", "UAG", "UGA"
        break
      else 
        # unexpected codon: throw errors
        raise ArgumentError.new("Unexpected codon: cannot translate to protein!")
      end
    }

    # handle incomplete codons case
    if strand.size.modulo(3) != 0
      # get the characters before a STOP codon
      pre_stop = strand.split(/(UAA|UAG|UGA)/, 2).first
    
      # are the characters BEFORE the stop valid codons
      if pre_stop.size.modulo(3) != 0 
        # unexpected codon length: throw errors
         raise ArgumentError.new("Unexpected codon length before STOP: cannot translate to protein!")   
      end 
    end

    proteins

  end
end
