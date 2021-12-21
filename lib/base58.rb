module Base58
  #Base58base58_encode('000000000000000000000000000000000000000000000001a838b13505b26867')
  def self.base58_encode(input)
    @chars = %w[
        1 2 3 4 5 6 7 8 9
      A B C D E F G H   J K L M N   P Q R S T U V W X Y Z
      a b c d e f g h i j k   m n o p q r s t u v w x y z
    ]
    @base = @chars.length

    i = input.to_i(16)
    buffer = String.new

    while i > 0
      remainder = i % @base
      i = i / @base
      buffer = @chars[remainder] + buffer
    end

    leading_zero_bytes = (input.match(/^([0]+)/) ? $1 : '').size / 2
    ("1"*leading_zero_bytes) + buffer
  end
end
