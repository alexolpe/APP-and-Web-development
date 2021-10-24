require 'i2c/drivers/lcd.rb'

class Rfid
	def initialize #constructor
		@display = I2C::Drivers::LCD::Display.new('/dev/i2c-1', 0x27, rows=20, cols=4)
	end
	
	def escriure(str)
		@display.clear #neteja la pantalla
		@display.text_multiline(str) #mètode que permet escriure en les diferent linies del display
	end
	
end

if __FILE__ == $0
	rf=Rfid.new
	puts "Inserte el mensaje: "
	mensaje = gets("/t/n") #llegeix de terminal, es guarda a un string
	rf.escriure(mensaje)
end
