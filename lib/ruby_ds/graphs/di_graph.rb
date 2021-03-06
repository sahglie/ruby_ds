require 'set'

module Graphs
  ##
  # Basic directed graph
  #
  class DiGraph

    def initialize(vertices)
      @adj = {}
      vertices.each { |v| @adj[v] = Set.new }
    end

    def add_edge(v, w)
      @adj.fetch(v).add(w)
    end

    def adj(v)
      @adj.fetch(v).dup
    end

    def num_vertices
      @adj.length
    end

    def vertices
      @adj.keys.dup
    end

  end
end
