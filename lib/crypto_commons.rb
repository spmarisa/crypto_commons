# frozen_string_literal: true
require 'digest'

require_relative "crypto_commons/version"
require_relative "./base58"
require_relative "./checksum"
require_relative "./elliptic_curve"

module CryptoCommons
  #Private key to Wallet Import Format, takes a Hex input
  def self.wif(private_key)
    extended = "80" + private_key + "01"
    extendedchecksum = extended + CheckSum.checksum(extended)
    wif = Base58.base58_encode(extendedchecksum)
  end

  #Private Key To Public Key, takes an Integer as input
  #CryptoCommons.to_public_key(76)
  def self.public_key(private_key)
    point = EllipticCurve.multiply(private_key, $g)

    # convert to hexadecimal
    x = point[:x].to_s(16).rjust(64, "0")
    y = point[:y].to_s(16).rjust(64, "0")

    # compressed public key format
    if (point[:y] % 2 == 0)
      prefix = "02"
    else
      prefix = "03"
    end

    prefix + x
  end

  #Private Key To Public Key Hash, takes an Integer as input
  #CryptoCommons.to_public_key_hash160(76)
  def self.public_key_hash160(private_key)
    publickey = public_key(private_key)
    binary = [publickey].pack("H*")
    sha256 = Digest::SHA256.digest(binary)
    ripemd160 = Digest::RMD160.digest(sha256)
    return ripemd160.unpack("H*")[0]
  end

  def self.address(private_key)
    hash160 = public_key_hash160(private_key)

    prefix = "00"
    checksum = CheckSum.checksum(prefix + hash160)
    address = Base58.base58_encode(prefix + hash160 + checksum)

    return address
  end
end
