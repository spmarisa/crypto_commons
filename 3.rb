require 'json'
require 'crypto_commons'

file = File.read('richest.json')


data_hash = JSON.parse(file)

wallet_hash = {}

data_hash['addresses'].each do |f|
  wallet_hash[f[1]] = true
end


flag = true

while flag
  number = rand(2**200..2**256)

  wallet_address = CryptoCommons.address(number)
  # wallet_address = "34xp4vRoCGJym3xR7yCVPFHoCNxv4Twseo"

  if wallet_hash[wallet_address]
    puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    puts number
    puts wallet_address
    flag = false
    puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
  else
    puts "404 Not found"
    puts number
    puts wallet_address
    puts "##############################"
  end
end
