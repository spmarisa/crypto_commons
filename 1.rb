require "crypto_commons"

i = 65
# i = 10

min = 2 ** i
puts min
max = 2 ** (i+1)
puts max

target = "13zb1hQbWVsc2S7ZTZnP2G4undNNpdh5so"
# target = "1PgQVLmst3Z314JrQn5TNiys8Hc38TcXJu"

flag = true
count = 0

while flag do
  count += 1
  tmp = rand(min..max)
  address = CryptoCommons.address(tmp)

  if address == target
    puts "******************************************"
    puts "FOUND KEY"
    puts tmp
    puts "******************************************"
    flag = false
  else
    puts count
    puts tmp
    puts address
    puts "Not found"
  end
end
