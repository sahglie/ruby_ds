class Trie

  class Node
    attr_accessor :val, :next

    def initialize
      @next = [nil] * 256
    end
  end

  def count
    @count
  end

  def initialize
    @root = Node.new
    @count = 0
  end

  def put(key, val)
    do_put(root, key, val, 0)
  end

  def get(key)
    if key.nil?
      nil
    else
      do_get(root, key, 0)
    end
  end

  def contains?(key)
    get(key).nil?
  end

  private

  def root
    @root
  end

  def do_put(node, key, val, pos)
    if node.nil?
      node = Node.new
    end

    if key.length == pos
      @count += 1 if node.val.nil?
      node.val = val
      return node
    end

    index = key[pos].ord
    node.next[index] = do_put(node.next[index], key, val, pos+1)
    node
  end

  def do_get(node, key, pos)
    if node.nil?
      nil
    elsif key.length == pos
      node.val
    else
      do_get(node.next[key[pos].ord], key, pos+1)
    end
  end

end
