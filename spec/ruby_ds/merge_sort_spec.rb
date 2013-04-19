require_relative '../spec_helper'


describe MergeSort do
  let(:heap) { MaxBinaryHeap.new }

  context('#initialize') do
    it 'sorts items sequentially' do
      items = [6, 7, 8, 9, 5, 4, 3, 2, 1]
      MergeSort.new(items).sort

      expect(items).to eql([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end
end
