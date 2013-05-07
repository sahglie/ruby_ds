module StringSearch
  class BoyerMoore

    def initialize(txt)
      @txt = txt
    end

    def search(pattern)
      right_shift = calc_right_shift(pattern)

      m = pattern.length
      n = @txt.length

      i = 0
      while i <= n-m
        j = m-1
        skip = 0
        while j >= 0
          if @txt[i+j] != pattern[j]
            skip = [1, j - right_shift[@txt[i+j].ord]].max
            break
          end
          j -= 1
        end

        return i if skip == 0
        i += skip
      end

      -1
    end

    private

    def calc_right_shift(pattern)
      right_shift = [-1] * 256
      pattern.length.times do |i|
        right_shift[pattern[i].ord] = i
      end
      right_shift
    end
  end
end
