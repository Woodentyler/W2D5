class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    acc = 0
    self.each_with_index do |x, idx|
      acc += (x.hash + idx).hash
    end
    acc.hash
  end
end

class String
  def hash
    # int = self.each_char { |x| x.ord}.join
    # p int
    # int.hash

    ary = self.chars.map { |x| x.ord}
    ary.hash

  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    ary = self.to_a.sort.hash #each_with_index.map do |sub_ary, idx| # hash into array. Sort array.
    #                                                           #  Map key value pairs to constituent hashes
    #   sub_ary.map! do |el|
    #     if el.class == Symbol # convert symbol in subarray to hash, convert key in subarray to hash
    #       el.to_s.hash
    #     else
    #       el.hash
    #     end
    #   end
    #
    # end
    #
    # ary = ary.each_with_index.map { |x, idx| x.reduce(:+) * (idx * 1000000000063) } # add two hashes together & blast with large prime to reduce collision
    #
    # ary.hash # native array hash

  end
end
