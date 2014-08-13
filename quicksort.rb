class QuicksortController
	def quicksort(array)
		if array.size < 2
			return array
		else
			pivot = array.sample
			array.delete_at(array.index(pivot))
			small = []
			big = []
			array.each do |x|
				if x <= pivot
					small << x
				else
					big << x
				end
			end
			sorted_array = []
			sorted_array << self.quicksort(small)
			sorted_array << pivot
			sorted_array << self.quicksort(big)
			sorted_array.flatten!
		end
		return sorted_array
	end
end

qs = QuicksortController.new
puts qs.quicksort([3, 1, 9, 2, 7, -1]) == [-1, 1, 2, 3, 7, 9]
puts qs.quicksort([5, -5, 11, 0, 3]) == [-5, 0, 3, 5, 11]
