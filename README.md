# PBE
Per facilitar la implementació de la funcionalitat string multilineal s'ha afegit el següent mètode a la classe "display" de la gema "i2c-lcd"

def text_multiline (string)
  arraylinies=string.split('*')
  row=0
  arraylinies.each do |linia|
    self.text(linia,row)
    row=row+1
  end
  end
