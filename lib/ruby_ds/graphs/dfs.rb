require 'set'

##
# Can be used with undirected as well as directed graphs
#
module Graphs
  class DFS

    def initialize(graph, src)
      @src = src
      @graph = graph
      @edge_to = {}
      @marked = Set.new

      dfs(src)
    end

    def path_to(v)
      path = []
      while @edge_to[v]
        path.push({ @edge_to[v] => v })
        v = @edge_to[v]
      end
      path.reverse
    end

    def path_to?(v)
      !path_to(v).empty?
    end

    private

    def dfs(v)
      @marked.add(v)

      @graph.adj(v).each do |w|
        unless @marked.include?(w)
          dfs(w)
          @edge_to[w] = v
        end
      end
    end

  end
end
