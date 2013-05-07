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
    @root = do_put(@root, key, val, 0)
  end

  def get(key)
    key.nil? ? nil : do_get(root, key, 0)
  end

  def contains?(key)
    get(key)
  end

  def delete(key)
    do_delete(@root, key, 0)
  end

  def longest_prefix_of(query)
    length = do_longest_prefix_of(@root, query, 0, 0)
    query[0...length]
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
    return nil if node.nil?
    return node.val if key.length == pos
    do_get(node.next[key[pos].ord], key, pos+1)
  end

  def do_delete(node, key, pos)
    if node.nil?
      nil
    elsif key.length == pos
      tmp = node.val
      node.val = nil
      tmp
    else
      index = key[pos].ord
      do_delete(node.next[index], key, pos+1)
    end
  end

  def do_longest_prefix_of(node, query, d, length)
    return length if node.nil?
    length = d if node.val
    return length if d == query.length

    c = query[d].ord
    do_longest_prefix_of(node.next[c], query, d+1, length)
  end
end
