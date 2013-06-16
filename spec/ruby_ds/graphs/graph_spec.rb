require_relative '../../spec_helper'


describe Graphs::Graph do
  let(:graph) { Graphs::Graph.new(%w(a b c d e f z)) }

  before(:each) do
    graph.add_edge("a", "b")
    graph.add_edge("a", "c")
    graph.add_edge("a", "e")

    graph.add_edge("b", "c")
    graph.add_edge("b", "d")
    graph.add_edge("b", "a")

    graph.add_edge("d", "b")
    graph.add_edge("d", "c")
    graph.add_edge("d", "f")

    graph.add_edge("f", "c")
    graph.add_edge("f", "d")
    graph.add_edge("f", "e")

    graph.add_edge("e", "f")
    graph.add_edge("e", "c")
    graph.add_edge("e", "a")
  end

  context("add_edge(v, w)") do
    it 'should add an edge to the graph' do
      expect(graph.num_vertices).to eql(7)
    end
  end

  context("adj(v)") do
    it 'should return nodes adjacent to v' do
      graph.adj("a").to_a.should =~ %w(b c e)
      graph.adj("b").to_a.should =~ %w(a c d)
      graph.adj("d").to_a.should =~ %w(b c f)
      graph.adj("f").to_a.should =~ %w(e c d)
      graph.adj("e").to_a.should =~ %w(a c f)
      graph.adj("c").to_a.should =~ %w(a b d e f)

      graph.adj("z").to_a.should be_empty
    end
  end
end
