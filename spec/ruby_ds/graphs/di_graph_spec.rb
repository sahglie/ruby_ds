require_relative '../../spec_helper'


describe Graphs::DiGraph do
  let(:graph) { Graphs::DiGraph.new(%w(a b c d e f z)) }

  before(:each) do
    graph.add_edge("a", "b")
    graph.add_edge("b", "c")
    graph.add_edge("c", "d")
    graph.add_edge("d", "e")
    graph.add_edge("e", "f")
    graph.add_edge("f", "g")
    graph.add_edge("c", "g")
    graph.add_edge("a", "e")
  end

  context("add_edge(v, w)") do
    it 'should add a directed edge to the graph' do
      expect(graph.num_vertices).to eql(7)
    end
  end

  context("adj(v)") do
    it 'should return nodes adjacent to v' do
      graph.adj("a").to_a.should =~ %w(b e)
      graph.adj("b").to_a.should =~ %w(c)
      graph.adj("d").to_a.should =~ %w(e)
      graph.adj("f").to_a.should =~ %w(g)
      graph.adj("e").to_a.should =~ %w(f)
      graph.adj("c").to_a.should =~ %w(d g)

      graph.adj("z").to_a.should be_empty
    end
  end
end
