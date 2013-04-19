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
  end

  def merge(low, mid, high)
  end
end
