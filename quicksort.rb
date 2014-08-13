# 定义类 加入需传入数组的快排方法 用来检测自己的写的方法对不对
class QuicksortController
	def quicksort(array)
		return array if array.size < 2
		small, big = array[1..-1].partition { |y| y <= array.first}
		sorted_array = quicksort(small) + [ array.first ] + quicksort(big)
		return sorted_array
	end
end

# 定义一个数组类 加入快排方法 方便链式调用
class Array
	def quick_sort!
	    return [] if self.empty?
	    x, *a = self
	    left, right = a.partition{|t| t < x}
	    left.quick_sort! + [x] + right.quick_sort!
	end
end

# 测试
qs = QuicksortController.new
puts qs.quicksort([3, 1, 9, 2, 7, -1]) == [-1, 1, 2, 3, 7, 9]
puts qs.quicksort([5, -5, 11, 0, 3]) == [-5, 0, 3, 5, 11]

b = ((1..100).to_a + (20..80).to_a).shuffle.sample(19)
puts b.quick_sort! == qs.quicksort(b)
