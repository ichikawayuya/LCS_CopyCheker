#!/usr/bin/env ruby
#-*- coding: utf-8 -*-

require 'pdf/reader'

class PdfString

        @file_name  = []
        @train_data = []
		@contents = []
        def initialize()

        end
        #pdfのファイル名を探して格納する
        def FindFileName()

                name = []
                Dir::glob("*/*.pdf").each do |f|
                        name.concat([f])
                end

                 @file_name = name

        end
        #ファイル名を取得する
        def getFileName()
                return @file_name
        end
        #PDFのファイルから文字列を抜き出す
        def convertPDFtoContents(path)
                convert = []
                contents = []
                pagecount = 0
                File.open(path, "rb") do |io|
                        # インスタンス化
                        reader = PDF::Reader.new(io)

                        # ページ単位で文字列を格納
                        reader.pages.each do |page|
                                convert.concat([page.text])
                                pagecount = pagecount + 1
                        end
                end
                        
                @page_counter = pagecount
        
                #文字列をスペース区切りで取得           
                convert.each do |content|
                        contents.concat(content.split(" "))
                end
                @contents = contents
        end

        #PDFの文字列を取得する
        def getContents()

                return @contents
        end
        #ページ枚数を取得する
        def getPageCount()
        end
		
		def DivitionStraigLine()
                contents = []
                @contents.each do |line|
                        contents.concat(line.split(""))
                end

                @contents = contents
        end

end

if __FILE__ == $0


        test  = GraduateThesis.new
        contents = []
        test.FindFileName
        path = test.getFileName()

        contents = test.convertPDFtoContents(path)
        contents.each do |p|
                print p + "\n"
        end
        #contents.each do |f|
        #       print f + "\n"
        #end


end
