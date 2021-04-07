#Write a method that reverses a Rot13 cipher
  #breaking down the phrase into words and then characters

ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
].freeze

def rot13(encrypted_text)
  encrypted_text.each_char.reduce('') do |final_str, char|
    final_str + decipher_char(char)
  end
end

def decipher_char(encypted_char)
  case encypted_char
  when ('a'..'m'), ('A'..'M') then (encypted_char.ord + 13).chr
  when ('m'..'z'), ('M'..'Z') then (encypted_char.ord - 13).chr
  else                              encypted_char
  end
end

ENCRYPTED_PIONEERS.each do |encrypted_text|
  puts rot13(encrypted_text)
end