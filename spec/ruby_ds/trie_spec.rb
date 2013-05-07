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
      trie.put('h', 1)
      expect(trie.get('h')).to eql(1)

      trie.put('ha', 1)
      expect(trie.get('ha')).to eql(1)
    end
  end

  context('#get(key)') do
    it 'retrieves values by key' do
      trie.put('hat', 1)
      expect(trie.get('hat')).to eql(1)
      expect(trie.get('ha')).to be_nil

      trie.put('hatter', 2)
      expect(trie.get('hatter')).to eql(2)

      expect(trie.get('hatterr')).to be_nil
    end
  end

  context('#delete(key') do
    it "should remove the key" do
      trie.put('hat', 1)
      expect(trie.delete('hat')).to eql(1)
      expect(trie.get("hat")).to be_nil
    end
  end

  context('#longest_prefix_of(query)') do
    it "should find the key that is longest prefix of query string" do
      trie.put("app", 1)
      trie.put("apple", 1)
      trie.put("applepie", 1)

      expect(trie.longest_prefix_of("applepants")).to eql("apple")
      expect(trie.longest_prefix_of("ap")).to eql("")
      expect(trie.longest_prefix_of("bumblebee")).to eql("")
      expect(trie.longest_prefix_of("")).to eql("")
    end
  end
end
