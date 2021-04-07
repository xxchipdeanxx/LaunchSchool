class DNA
  attr_reader :dna_seq

  def initialize(string)
    @dna_seq = string
  end

  def hamming_distance(other_dna)
    short_strand, long_strand = dna_seq.size == other_dna.size ? [dna_seq,other_dna] : [dna_seq,other_dna].minmax {|a,b| a.size <=> b.size}

    distance = 0
    short_strand.chars.each_with_index do |acid, index|
      distance += 1 unless acid == long_strand[index]
    end
    distance
  end
end
