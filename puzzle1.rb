require 'i2c/drivers/lcd.rb'

class Rfid
	def initialize #constructor
		@display = I2C::Drivers::LCD::Display.new('/dev/i2c-1', 0x27, rows=20, cols=4)
	end
	
	def escriure
		@display.clear #neteja la pantalla
		puts "Inserte el mensaje: "
		mensaje = gets.chomp #llegeix de terminal, es guarda a un string i s'elimina el caràcter del return
		@display.text_multiline(mensaje) #mètode que permet escriure en les diferent linies del display
	end
	
end

if __FILE__ == $0
	rf=Rfid.new
	rf.escriure
end
