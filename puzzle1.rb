require 'i2c/drivers/lcd.rb'

class Rfid
	
	def escriure
		display = I2C::Drivers::LCD::Display.new('/dev/i2c-1', 0x27, rows=20, cols=4)

		display.clear #neteja la pantalla
		puts "Inserte el mensaje: "
		mensaje = gets #llegeix de terminal i es guarda a un string
		arraymensaje = mensaje.chars #transforma el string en array
		arraymensaje.pop #elimina el caracter del return

		#FUNCIONALITAT STRING MULTILINEA (separador: *)
		mensajeimpreso=""
		fila=0
		arraymensaje.each do |letra| #recorre l'array
			if letra =="*"
				display.text(mensajeimpreso,fila)
				fila=fila +1
				mensajeimpreso=""
			else
				mensajeimpreso<<letra
				display.text(mensajeimpreso,fila)
			end #corresponent al if else
	
		end #corresponent al each do

	end #corresponent a def escriure
	
end #corresponent a class Rfid

if __FILE__ == $0
	rf=Rfid.new
	escriptura=rf.escriure
end
