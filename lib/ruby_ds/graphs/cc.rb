module Graphs
  ##
  # Determines if two vertices are in the same connected component
  #
  class CC
    def initialize(graph)
      @components = {}
      @graph = graph
      @count = 0
      @marked = {}

      @graph.vertices.each do |v|
        dfs(v) unless @marked[v]
        @count += 1
      end
    end

    def connected?(v, w)
      @components[v] == @components[w]
    end

    private

    def dfs(v)
      @marked[v] = true
      @components[v] = @count
      @graph.adj(v).each { |w| dfs(w) unless @marked[w] }
    end
  end
end
