class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @next.prev = @prev
    @prev.next = @next
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    self[key].val if include?(key)
  end

  def include?(key)
    p self[key]
    p "LARGE ATTENTION GRBBING STRING"

    !!self[key]

  end

  def append(key, val)
    n = Node.new(key,val)
    old_last = @tail.prev
    old_last.next = n # prior last now points to new last
    n.next = @tail
    n.prev = old_last
    @tail.prev = n
  end

  def update(key, new_val)
    self[key].val = new_val
  end

  def remove(key)
    get[key].remove
  end

  def each
    checking = @first

    until checking == @tail
      yield(checking)
      checking = checking.next
    end

  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end

n1 = Node.new(0,'a')
n2 = Node.new(1,'b')
n3 = Node.new(2,'c')
