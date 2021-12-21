module EllipticCurve
  #copied
  #y^2 = x^3 + ax + b
  $a = 0
  $b = 7

  #prime modulus
  $p = 2 ** 256 - 2 ** 32 - 2 ** 9 - 2 ** 8 - 2 ** 7 - 2 ** 6 - 2 ** 4 - 1

  #number of points on the curve
  $n = 115792089237316195423570985008687907852837564279074904382605163141518161494337

  #generator point (the starting point on the curve used for all calculations)
  $g = {
    x: 55066263022277343669578718895168534326250603453777594175500187360389116729240,
    y: 32670510020758816978083085130507043184471273380659243275938904335757337482424,
  }

  #Modular Inverse.
  def self.modinv(a, m = $p)
    a = a % m if a < 0
    prevy, y = 0, 1
    while a > 1
      q = m / a
      y, prevy = prevy - q * y, y
      a, m = m % a, a
    end
    return y
  end

  #Double - Add a point on the curve to itself.
  def self.double(point)
    #slope = (3x^2 + a) / 2y
    slope = ((3 * point[:x] ** 2) * modinv((2 * point[:y]))) % $p # using modular inverse to perform "division"

    #new x = slope^2 - 2x
    x = (slope ** 2 - (2 * point[:x])) % $p
    #new y = slope * (x - new x) * y
    y = (slope * (point[:x] - x) - point[:y]) % $p

    return { x: x, y: y }
  end

  #Add - Add two points together.
  def self.add(point1, point2)
    #double if both points are the same
    return double(point1) if point1 == point2

    #slope = (y1 - y2) / (x1 - x2)
    slope = ((point1[:y] - point2[:y]) * modinv(point1[:x] - point2[:x])) % $p
    #new x = slope^2 - x1 - x2
    x = (slope ** 2 - point1[:x] - point2[:x]) % $p
    #new y = slope * (x1 - new x) - y1
    y = ((slope * (point1[:x] - x)) - point1[:y]) % $p

    return { x: x, y: y }
  end

  #Multiply - Use the double and add operations to multiply a point by an integer.
  def self.multiply(k, point = $g)
    # create a copy the initial starting point (for use in addition later on)
    current = point

    # convert integer to binary representation (for use in the double and add algorithm)
    binary = k.to_s(2)

    # double and add algorithm for fast multiplication
    binary.split("").drop(1).each do |char| # ignore first binary character
      # 0 = double
      current = double(current)

      # 1 = double and add
      if char == "1"
        current = add(current, point)
      end
    end

    return current
  end
end
