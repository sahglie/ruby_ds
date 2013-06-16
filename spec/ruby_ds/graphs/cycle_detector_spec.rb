require_relative '../../spec_helper'


describe "Graphs::CycleDetector for cyclic graph" do
  let(:graph) { Graphs::DiGraph.new(%w(a b c d e f)) }

  before(:each) do
    graph.add_edge("a", "b")
    graph.add_edge("b", "c")
    graph.add_edge("c", "e")
    graph.add_edge("c", "f")
    graph.add_edge("e", "f")
    graph.add_edge("e", "a")
    graph.add_edge("e", "d")
  end

  context("has_cycle?") do
    it 'is true if graph has a cycle' do
      expect(Graphs::CycleDetector.new(graph).has_cycle?).to be_true
    end
  end
end


describe "Graphs::CycleDetector for acyclic graph" do
  let(:graph) { Graphs::DiGraph.new(%w(a b c d e f)) }

  before(:each) do
    graph.add_edge("a", "b")
    graph.add_edge("b", "c")
    graph.add_edge("c", "e")
    graph.add_edge("c", "f")
    graph.add_edge("e", "f")
    graph.add_edge("e", "d")
  end

  context("has_cycle?") do
    it 'is false if graph does not have a cycle' do
      expect(Graphs::CycleDetector.new(graph).has_cycle?).to be_false
    end
  end
end
