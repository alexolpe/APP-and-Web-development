# PBE
Per poder implementar una versió millorada, s'ha creat el mètode text_multiline a la classe display
       
       def text_multiline (string)
          arraylinies=string.split('*') //separem les línies pel caràcter '*'
          row=0
          arraylinies.each do |linia|
           self.text(linia,row) //ens referim al mètode text(string,row) que ja venia implementat a la gema instal·lada
            row=row+1
          end
        end
