require_relative '../spec_helper'


describe MaxBinaryHeap do
  let(:heap) { MaxBinaryHeap.new }

  context('#initialize') do
    it "works" do
      expect(heap.size).to eql(0)
      expect(heap).to be_empty
    end
  end

  context('#insert(item)') do
    it "works" do
      heap.insert(7)
      expect(heap.items).to eql([7])

      heap.insert(10)
      expect(heap.items).to eql([10, 7])

      heap.insert(13)
      expect(heap.items).to eql([13, 7, 10])
    end
  end

  context("#delete_max") do
    it 'works for heap with 1 item' do
      heap.insert(7)
      expect(heap.delete_max).to eql(7)
      expect(heap.items).to eql([])
    end

    it 'works for heap with 2 items' do
      heap.insert(7)
      heap.insert(10)
      expect(heap.delete_max).to eql(10)
      expect(heap.items).to eql([7])
    end

    it 'works for heap with 3 itemss' do
      heap.insert(7)
      heap.insert(10)
      heap.insert(13)
      expect(heap.delete_max).to eql(13)
      expect(heap.items).to eql([10, 7])
    end

    it 'works when interleaved with #insert(item)' do
      heap.insert(1)
      heap.insert(2)
      heap.insert(3)
      heap.insert(4)
      expect(heap.delete_max).to eql(4)

      heap.insert(5)
      expect(heap.delete_max).to eql(5)

      heap.insert(5)
      heap.insert(6)
      expect(heap.delete_max).to eql(6)
    end

    it "works" do
      heap.insert(5)
      heap.insert(4)
      heap.insert(3)
      heap.insert(2)
      heap.insert(1)

      expect(heap.delete_max).to eql(5)
      expect(heap.delete_max).to eql(4)
      expect(heap.delete_max).to eql(3)
    end
  end

  context("#size") do
    it 'works after inserts' do
      heap.insert(1)
      expect(heap.size).to eql(1)

      heap.insert(2)
      expect(heap.size).to eql(2)

      heap.insert(3)
      expect(heap.size).to eql(3)
    end

    it 'it works after delete_max' do
      heap.insert(1)
      heap.insert(2)
      heap.insert(3)
      heap.insert(4)

      heap.delete_max
      expect(heap.size).to eql(3)
    end
  end
end
