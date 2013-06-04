# HK ID generator. http://www.cs.skhbbss.edu.hk/tm/hkid/hkid.php

def hk_id_gen(size = 10)
  alphas = ('A' .. 'Z').to_a
  alpha_weights = {
    "A" => 1,
    "L" => 1,
    "W" => 1,
    "B" => 2,
    "M" => 2,
    "X" => 2,
    "C" => 3,
    "N" => 3,
    "Y" => 3,
    "D" => 4,
    "O" => 4,
    "Z" => 4,
    "E" => 5,
    "P" => 5,
    "F" => 6,
    "Q" => 6,
    "G" => 7,
    "R" => 7,
    "H" => 8,
    "S" => 8,
    "I" => 9,
    "T" => 9,
    "J" => 10,
    "U" => 10,
    "K" => 11,
    "V" => 11,
  }

  hk_ids = Enumerator.new do |y|

    alpha_weights.keys.shuffle.each do |alpha_series|
      (0..(10**7 -1)).to_a.each do |i|
        padding = 7 - i.to_s.length
        candidate = "#{'0' * padding}#{i}"

        sum = 0
        candidate.chars.each_with_index do |char, index|
          sum+= char.to_i * (7-index)
        end

        sum += 8 * alpha_weights[alpha_series]

        y.yield "#{alpha_series}#{candidate}" if (sum % 11) == 0
      end
    end

  end

  hk_ids.take(5000).shuffle.take(size)
end
