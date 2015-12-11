#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

require "./LCS.rb"

require "./PdfString.rb"

class CopyCheck
	@lsc_cheker
	@counter
	@first_contents
	@second_contents
	@result
	@copy_parsent
	@string1
	@string2
	
	def initialize(path1, path2)
		@string1 = PdfString.new()
		@string2 = PdfString.new()
		@string1.convertPDFtoContents(path1)
		@string2.convertPDFtoContents(path2)
		@first_contents = @string1.getContents()
		@second_contents = @string2.getContents()
		
	end
	
	def Copy()
		@lcs_cheker = LCS.new()
		@lcs_cheker.LcsCheck(@first_contents, @second_contents)
		@result = @lcs_cheker.LcsContainment(@first_contents.size, @second_contents.size,@lcs_cheker.LcsArray(), 0)
		count = 0
		result = @result
		
		#格納されているかの確認
		0.upto(result.length) do |i|
			if(result[i] == "")
				result[i] = "nil"
				
			else
				count = count + 1
			end
		end
		
		count = count - 1

		#全体から確率を計算
		@copy_parsent = count/result.length.to_f
		
		@result = result
		
		
		if(@copy_parsent >= 0.8)
			return 1
		end
		
		return 0
	end
		
end
