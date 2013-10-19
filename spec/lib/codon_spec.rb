require 'spec_helper'

describe Codon do
  include Codon

  it 'translates a base-36 character to a 6-character codon' do
    codon = char_to_codon('c')

    expect(codon.to_s.size).to eq 7
    expect(codon).to eq 'g5iol0q'
  end

  it 'translates integers' do
    codon = char_to_codon('3')

    expect(codon.to_s.size).to eq 7
    expect(codon).to eq '7w9fcrh'
  end

  it 'translates back from codons' do
    expect(codon_to_char('g5iol0q')).to eq 'c'
    expect(codon_to_char('7w9fcrh')).to eq '3'
  end
end