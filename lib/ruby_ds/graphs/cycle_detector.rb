require 'set'

module Graphs
  class CycleDetector

    def initialize(graph)
      @graph = graph
      @onstack = {}
      @marked = {}

      graph.vertices.each do |v|
        dfs(v) unless @marked[v]
        break if has_cycle?
      end
    end

    def has_cycle?
      @cycle
    end

    private

    def dfs(v)
      @marked[v] = true
      @onstack[v] = true

      @graph.adj(v).each do |w|
        return if has_cycle?

        if !@marked[w]
          dfs(w)
        elsif @onstack[w]
          @cycle = true
        end
      end

      @onstack[v] = false
    end
  end
end
