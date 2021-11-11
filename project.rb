require 'json'
require 'http'
require "gtk3"
require "./nfc"
require 'thread'

#response = HTTP.get("https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY").to_s
#puts response


#j = '{"a": 1, "b": 2}'
#puts JSON.parse(j)
	
class Finestra < Gtk::Window
	@@label 
	@@r
	@@uid
	@@blanc=Gdk::RGBA::new(1.0,1.0,1.0,1.0)
	@@blau= Gdk::RGBA::new(0,0,1.0,1.0)
	@@vermell=Gdk::RGBA.new(1.0,0,0,1.0)
	@@canvi
	@@grid1
	@@grid2
	@@label1
	@@label2
	@@window
	
	def initialize
		@css_provider = Gtk::CssProvider.new
		@style_provider = Gtk::StyleProvider::PRIORITY_USER
		@css_provider.load(:data=> File.read("diseny.css"))
		
		@@window = Gtk::Window.new("inter")
		@@window.set_size_request(250,250)
		@@window.set_border_width(10)
		@@window.set_window_position(:CENTER)
		@@window.style_context.add_provider(@css_provider,@style_provider)
		
		@uid=" "
		
		@@grid1 = Gtk::Grid.new
		grid1.set_row_homogeneous(true)
		grid1.set_column_homogeneous(true)
		
		@@grid2 = Gtk::Grid.new
		grid2.set_row_homogeneous(true)
		grid2.set_column_homogeneous(true)
		
		font = Pango::FontDescription.new('20')
		@@label1 = Gtk::Label.new("Please login with your university card",{:use_underline =>false})
		@@label2 = Gtk::Label.new("Logout",{:use_underline =>false})
		@@label2.override_font(font)
		@@label1.override_font(font)
	end
	
	def finestra1
		@@window.remove(grid2)
		@@window.add(grid1)
		
		@@label1.override_background_color(:normal,@@blau)
		@@label1.override_color(:normal,@@blanc)
		grid.attach( @@label1,0,0,5,5)
		window.show_all
		
		@@r = Rfid.new
		fil
	end
	
	def finestra2
		@@window.remove(grid1)
		@@window.add(grid2)
		
		button = Gtk::Button.new(:label ="Logout")
		grid.attach(button,1,6,1,1)
		grid.attach( @@label2,0,0,1,1)
		window.show_all
		button.signal_connect("clicked") do
			self.finestra1
		end
	end

	
	#Funció fil, consisteix en un thread que llegira el uid
	def fil
		t = Thread.new{
			llegeix
			puts "acabo el thread"
			t.exit
		}
	end
	
	#Funció  que llegiex l'uid
	def llegeix
			@@uid = @@r.read_uid
			#Punt clau del codi, delegar la tasca a canvipantalles
			GLib::Idle.add{canvipantalles}
			puts "surto"
	end

	#Funció que canvia la pantalla i la posa de color vermell i mostra l'uid
	def canvipantalles
		if @@uid != ""#falta completar
			self.finestra2
		end
		
	end
end


#main del codi
f = Finestra.new
f.finestra1
Gtk.main
