require 'digest'

module CheckSum
  def self.double_hash256(hex)
      binary = [hex].pack("H*")
      hash1 = Digest::SHA256.digest(binary)
      hash2 = Digest::SHA256.digest(hash1)
      result = hash2.unpack("H*")[0]
      return result
  end

  def self.checksum(hex)
    hash = double_hash256(hex) # Hash the data through SHA256 twice
    return hash[0...8]  # Return the first 4 bytes (8 characters)
  end
end
