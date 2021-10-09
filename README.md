# PBE
Per poder implementar una versió millorada, s'ha creat el mètode text_multiline a la classe display
       
       def text_multiline (string)
          arraylinies=string.split('*')
          row=0
          arraylinies.each do |linia|
           self.text(linia,row)
            row=row+1
          end
        end
