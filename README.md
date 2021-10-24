# PBE
Per poder implementar una versió millorada, s'ha creat el mètode text_multiline a la classe display
       
       def text_multiline (string)
	       row=0
       	string.each_line do |line|
            		self.text(line.chomp,row)
            		row=row+1
          	end
       end

