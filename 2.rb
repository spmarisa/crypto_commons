require 'httparty'
require 'crypto_commons'
  flag = true

  while flag
    number = rand(2**255..2**256)
    wallet = CryptoCommons.address(number)
    url = 'https://api.blockcypher.com/v1/btc/main/addrs/' + wallet + '/balance'
    response = HTTParty.get(url)
    puts response
    if response["balance"] > 0
      flag = false
      puts "**********************************"
      puts "**********************************"
      puts number
      puts wallet
      puts response["balance"]
      puts "**********************************"
      puts "**********************************"
    else
            puts "**********************************"
            puts number
            puts wallet
            puts response["balance"]
            puts "**********************************"

    end
  end
