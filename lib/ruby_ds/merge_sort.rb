require 'rspec'


class MergeSort
  def initialize(items)
    @items = items
  end

  def sort
    do_sort(0, @items.length-1)
  end

  private

  def do_sort(low, high)
    if low < high
      mid = (low + high) / 2
      do_sort(low, mid)
      do_sort(mid+1, high)
      merge(low, mid, high)
    end
  end

  def merge(low, mid, high)
    # TODO: really inefficient
    items = @items.dup

    j = low
    k = mid+1
    while j <= mid && k <= high
      if items[j] < items[k]
        @items[low] = items[j]
        j += 1
      else
        @items[low] = items[k]
        k += 1
      end
      low += 1
    end

    while j <= mid
      @items[low] = items[j]
      j += 1
      low += 1
    end

    while k <= high
      @items[low] = items[k]
      k += 1
      low += 1
    end
  end
end
