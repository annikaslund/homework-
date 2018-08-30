fish_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# O(n^2) - quadratic
def sluggish_oct(arr)
  max = ''

  fish_arr.each_with_index do |fish1, idx1|
    fish1 = max if max.empty?

    fish_arr.each_with_index do |fish2, idx2|
      next if idx1 == idx2
      max = fish2 if fish2.length > max.length
    end
  end

  max
end

# O(n log n) - log linear
class Array
  def dom_oct(&prc)
    prc ||= Proc.new { |x,y| x<=>y  }

    return self if self.count <= 1

    mid = self.count / 2
    sorted_left = self.take(mid).merge_sort(&prc)
    sorted_right = self.drop(mid).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge_sort(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when 0
        merged << left.shift
      when -1
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end

def clever_oct(arr)
  longest_fish = ""

  arr.each do |fish|
    longest_fish = fish if fish.length > longest_fish.length
  end

  longest_fish
end
