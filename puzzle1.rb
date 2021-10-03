require 'i2c/drivers/lcd.rb'

class Rfid
	
	def escriure
		display = I2C::Drivers::LCD::Display.new('/dev/i2c-1', 0x27, rows=20, cols=4)

		display.clear #neteja la pantalla
		puts "Inserte el mensaje: "
		mensaje = gets #llegeix de terminal i es guarda a un string
		arraymensaje = mensaje.chars #transforma el string en array
		arraymensaje.pop #elimina el caracter del return

		mensajeimpreso=""
		fila=0
		
		#FUNCIONALITAT STRING MULTILINEA:recorre l'array i si es detecta un '*', es mostra a la primera fila el missatge previ i es salta de fila
		arraymensaje.each do |letra|
			if letra =="*"
				display.text(mensajeimpreso,fila)
				fila=fila +1
				mensajeimpreso=""
			else
				mensajeimpreso<<letra
				display.text(mensajeimpreso,fila)
			end
	
		end 

	end
	
end

if __FILE__ == $0
	rf=Rfid.new
	rf.escriure
end
