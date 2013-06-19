require 'set'

module Graphs
  class CycleDetector

    def initialize(graph)
      @cycle = []
      @edge_to = {}
      @onstack = {}
      @marked = {}

      @graph = graph
      @graph.vertices.each do |v|
        dfs(v) unless @marked[v]
        break if has_cycle?
      end
    end

    def cycle
      @cycle
    end

    def has_cycle?
      !@cycle.empty?
    end

    private

    def dfs(v)
      @marked[v] = true
      @onstack[v] = true

      @graph.adj(v).each do |w|
        return if has_cycle?

        if !@marked[w]
          @edge_to[w] = v
          dfs(w)
        elsif @onstack[w]
          x = v
          while @edge_to[x]
            @cycle.unshift(@edge_to[x])
            x = @edge_to[x]
          end
          @cycle.push(v)
          @cycle.push(x)
        end
      end

      @onstack[v] = false
    end
  end
end
