require_relative '../../spec_helper'


describe StringSearch::BoyerMoore do
  let(:haystack) { "findinhaystackneedle" }
  let(:needle) { "needle" }

  it 'should return index of first occurrence' do
    search = StringSearch::BoyerMoore.new(haystack)
    expect(search.search(needle)).to eql(14)
  end

  it 'should return -1 if no occurrence is found' do
    search = StringSearch::BoyerMoore.new(haystack)
    expect(search.search('fart')).to eql(-1)
  end

end
