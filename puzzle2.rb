require 'gtk3'
require_relative 'puzzle1'
require 'thread'

class GtkLcd

  def initialize
    @rf=Rfid.new
    @window=Gtk::Window.new("Puzzle 2")
  end
  
  def montarVentana
    @window.set_size_request(400, 100)
    @window.set_border_width(10)
    
    caja = Gtk::Fixed.new
    @window.add(caja)

    display = Gtk::TextView.new
    display.set_editable(true)
    display.set_cursor_visible(true)
    display.show
    buf=display.buffer
    caja.put(display, 0,0)

    button = Gtk::Button.new(:label => "Display")
    button.set_size_request(380, 32)
    button.signal_connect "clicked" do |_widget|
      self.hilo(self.coger_mensaje(buf))
    end
    caja.put(button, 0, 100)

    @window.signal_connect("delete-event") { |_widget| Gtk.main_quit }
    @window.show_all
  end
  
  def hilo(missatge)
    h=Thread.new{
      @rf.escriure(missatge)
      h.exit
    }
  end
  
  def coger_mensaje(buf)
    iter1=buf.start_iter
    iter2=buf.end_iter
    missatge=buf.get_text(iter1,iter2,false)
    return missatge
  end
  
end

if __FILE__ == $0
	rf=GtkLcd.new
  rf.montarVentana
  Gtk.main
end

