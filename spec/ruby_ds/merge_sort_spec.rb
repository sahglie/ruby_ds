require_relative '../spec_helper'


describe MergeSort do
  let(:heap) { MaxBinaryHeap.new }

  context('#initialize') do
    it "works" do
      # items = [8, 7, 6, 5, 4, 3, 2, 1]
      items = [6, 7, 8, 9, 5, 4, 3, 2, 1]
      ms = MergeSort.new(items)
      ms.sort
      pp items
    end
  end
end
