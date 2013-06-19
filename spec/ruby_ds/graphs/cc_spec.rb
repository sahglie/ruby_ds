require_relative '../../spec_helper'


describe "Graphs::CC" do
  let(:graph) { Graphs::Graph.new(%w(a b c d e f g h i j)) }

  before(:each) do
    # component 1
    graph.add_edge("a", "b")
    graph.add_edge("b", "c")
    graph.add_edge("b", "e")
    graph.add_edge("b", "f")
    graph.add_edge("e", "f")
    graph.add_edge("e", "d")
    graph.add_edge("d", "a")

    # component 2
    graph.add_edge("g", "h")
    graph.add_edge("h", "i")
    graph.add_edge("h", "j")
  end

  context("connected?") do
    it 'is true if vertices are connected' do
      finder = Graphs::CC.new(graph)
      expect(finder.connected?('a', 'b')).to be_true
      expect(finder.connected?('a', 'f')).to be_true
      expect(finder.connected?('e', 'c')).to be_true
      expect(finder.connected?("j", "g")).to be_true
    end

    it 'is false if vertices are not connected' do
      finder = Graphs::CC.new(graph)
      expect(finder.connected?("a", "g")).to be_false
      expect(finder.connected?("c", "j")).to be_false
    end
  end
end
