require 'set'

module Graphs
  class CycleDetector

    def initialize(graph)
      @graph = graph
      @cycle = false
      @marked = {}

      @count = 0
      graph.vertices.each do |v|
        dfs(v)
        break if has_cycle?
        @count += 1
      end
    end

    def has_cycle?
      @cycle
    end

    private

    def dfs(v)
      return if @marked[v]
      @marked[v] = @count

      @graph.adj(v).each do |w|
        if @marked[w] == @count
          pp v
          pp w
          @cycle = true
          break
        end

        dfs(w)
      end
    end
  end
end
