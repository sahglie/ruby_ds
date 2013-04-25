require_relative '../spec_helper'


describe Trie do
  let(:trie) { Trie.new }

  context('#count') do
    it 'is 0 when no keys have been added' do
      expect(trie.count).to eql(0)
    end

    it 'is incremented with each new key' do
      trie.put("cauchy", 1)
      expect(trie.count).to eql(1)

      trie.put("cauchy", 1)
      expect(trie.count).to eql(1)

      trie.put("isis", 2)
      expect(trie.count).to eql(2)
    end
  end

  context('#put(key, val)') do
    it 'stores values by key' do

    end
  end

  context('#get(key)') do
    it 'retrieves values by key' do
      trie.put('hat', 1)
      expect(trie.get('hat')).to eql(1)

      trie.put('hatter', 2)
      expect(trie.get('hatter')).to eql(2)

      expect(trie.get('hatterr')).to be_nil
    end
  end

end
