# 定义一个数组类 加入快排方法 方便链式调用
class Array
	def quick_sort!
	    return [] if self.empty?
	    x, *a = self
	    left, right = a.partition{|t| t < x}
	    left.quick_sort! + [x] + right.quick_sort!
	end
	# 需传入数组的快排方法 from wiki 用来检测自己的写的方法是否正确
	def quicksort
		return self if self.size < 2
		small, big = self[1..-1].partition { |y| y <= self.first}
		sorted_array = small.quicksort + [ self.first ] + big.quicksort
		return sorted_array
	end
end

# 测试from wiki的方法是否正确
puts [3, 1, 9, 2, 7, -1].quicksort == [-1, 1, 2, 3, 7, 9]
puts [5, -5, 11, 0, 3].quicksort == [-5, 0, 3, 5, 11]

require "json"

# 生成数据
# b = (1..10000).to_a.shuffle.sample(10000)
# f = File.open("data.json", "w") { |f|  
# 	f.syswrite(b.to_json)
# }

# 读取数据
f = File.open("data.json","r")
b = JSON.parse(f.read)

puts b.quick_sort! == b.quicksort
