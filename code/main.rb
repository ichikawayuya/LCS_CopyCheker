#!/usr/bin/env ruby
#-*- coding: utf-8 -*-
require "./CopyCheck.rb"

if __FILE__ == $0
	print "path1を入力してください:"
	path1 = gets.chop
	print "path2を入力してください："
	path2 =  gets.chop
	
	check = CopyCheck.new("#{path1}", "#{path2}")
	if(check.Copy() == 1)
		puts "コピ-している確率があります"
	else
		puts "問題ありません\n"
	end
end