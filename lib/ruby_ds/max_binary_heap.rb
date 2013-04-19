class MaxBinaryHeap
  EmptyHeapError = Class.new(StandardError)
  NilInsertError = Class.new(StandardError)

  def initialize
    @items = [nil]
    @size = 0
  end

  def insert(item)
    @size += 1
    @items[@size] = item
    swim(@size)
  end

  def delete_max
    exchange(1, @size)
    @size -= 1
    sink(1)
    @items[@size+1]
  end

  def empty?
    @size == 0
  end

  def size
    @size
  end

  # TODO: remove this once specs are done
  def items
    @items[1..@size]
  end

  private

  def sink(n)
    while 2*n <= @size
      k = 2*n
      if k < @size && @items[k] < @items[k+1]
        k += 1
      end
      if @items[n] > @items[k]
        break
      end
      exchange(n, k)
      n = k
    end
  end

  def swim(n)
    while n > 1 && @items[n] > @items[n/2]
      exchange(n, n/2)
      n /= 2
    end
  end

  def exchange(a, b)
    @items[a], @items[b] = @items[b], @items[a]
  end
end


