#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

class LCS
	@lcs
	@a = []
	@b = []
	@result = []
	@lcs
	@count = 0
	
	def intilize()
	end
	
	def LcsCheck(a, b)
		@a = a
		@b = b
		@lcs = Array.new(@a.size + 1).map{ Array.new(@b.size + 1, 0) }	
		lcs = @lcs
		1.upto(a.size) do |i|
			1.upto(b.size) do |j|
				if(a[i - 1] == b[j - 1])
					lcs[i][j] = lcs[i - 1][j - 1] + 1
				else
					lcs[i][j] = lcs[i][j - 1]
				end
			end
		end
		@lcs = lcs
	end
	def LcsArray()
		result = []
		if(@a.size >= @b.size)
			i = @a.size
		else
			i = @b.size
		end
		0.upto(i- 1) do 
			result.concat([""])
		end
		@result = result
		#return @result
	end
	
	def LcsContainment(i, j, result, count)
		return if(i == 0 || j == 0)
		if(@a[i - 1] == @b[j - 1])
			LcsContainment(i - 1, j -1, result, count + 1)
			result[count] = @a[i - 1]
			count = count + 1
		else
			if(@lcs[i-1][j] >= @lcs[i][j -1])
				 LcsContainment(i-1, j, result,count)
			else
      			LcsContainment(i, j-1, result, count)
			end
 		end
		@result = result
		return @result	
	end
	
end
