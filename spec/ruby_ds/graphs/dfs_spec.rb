require_relative '../../spec_helper'


describe "Graphs::DFS with undirected graph" do
  let(:graph) { Graphs::Graph.new(%w(a b c d e f g h i)) }

  before(:each) do
    graph.add_edge("a", "b")
    graph.add_edge("a", "d")
    graph.add_edge("b", "c")
    graph.add_edge("c", "e")
    graph.add_edge("c", "f")
    graph.add_edge("d", "e")
    graph.add_edge("e", "f")
    graph.add_edge("e", "g")
    graph.add_edge("g", "h")
    graph.add_edge("h", "i")
  end

  context("path_to?(i)") do
    it 'should find path from e -> i' do
      Graphs::DFS.new(graph, "e").path_to?("i").should be_true
      #pp Graphs::DFS.new(graph, "e").path_to("i")
    end

    it 'should find path from a -> i' do
      Graphs::DFS.new(graph, "a").path_to?("i").should be_true
      #pp Graphs::DFS.new(graph, "a").path_to("i")
    end

    it 'should not find path from a -> x' do
      Graphs::DFS.new(graph, "a").path_to?("x").should be_false
      #pp Graphs::DFS.new(graph, "a").path_to("x")
    end
  end
end


describe "Graphs::DFS with directed graph" do
  let(:graph) { Graphs::DiGraph.new(%w(a b c d e f g h i)) }

  before(:each) do
    graph.add_edge("a", "b")
    graph.add_edge("b", "e")
    graph.add_edge("e", "c")
    graph.add_edge("e", "d")
    graph.add_edge("e", "g")
    graph.add_edge("c", "b")
    graph.add_edge("c", "h")
    graph.add_edge("h", "f")
    graph.add_edge("h", "i")
  end

  context("path_to?(i)") do
    it 'should find path from a -> i' do
      Graphs::DFS.new(graph, "a").path_to?("i").should be_true
      #pp Graphs::DFS.new(graph, "a").path_to("i")
    end

    it 'should find path from c -> d' do
      Graphs::DFS.new(graph, "c").path_to?("d").should be_true
      #pp Graphs::DFS.new(graph, "c").path_to("d")
    end

    it 'should not find path from e -> a' do
      Graphs::DFS.new(graph, "e").path_to?("a").should be_false
      #pp Graphs::DFS.new(graph, "e").path_to("a")
    end
  end
end
