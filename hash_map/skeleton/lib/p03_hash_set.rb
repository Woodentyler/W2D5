require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num)
      self[num] << num
      @count += 1
      resize! if @count == num_buckets
    end
  end

  def remove(num)
    if include?(num)
      self[num].delete_if { |x| x == num }
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    @holder = []

    @count.times do
      @store << Array.new
    end

    @store[0..@count].each do |bucket|
      bucket.each do |el|
        remove(el)
        @holder << el
      end
    end

    @count = 0

    @holder.each do |el|
      insert(el)
    end

  end
end
