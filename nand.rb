class Nand

  def self.not(a)
    if a==0 then 1 else 0 end
  end

  def self.and(a,b)
    a & b
  end

  def self.or(a,b)
    a | b
  end

  def self.nand(a,b)
    self.not(a & b)
  end

  def self.nor(a,b)
    self.not(a | b)
  end

  def self.xor(a,b)
    a ^ b
  end
end
