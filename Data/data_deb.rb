def on_debito

window = Gtk::Window.new

window.override_background_color :normal, Gdk::RGBA::new(1.2, 2.3, 3.4, 1)

window.border_width = 10

window.title = "IVA Debito"

fixed = Gtk::Fixed.new

label = Gtk::Label.new "Introduzca el Valor"

fixed.put label, 30, 10

entry = Gtk::Entry.new

fixed.put entry, 10, 60

button_calcular = Gtk::Button.new :label => "Calcular"

button_calcular.set_tooltip_text "Calcular Iva Debito"

fixed.put(button_calcular, 10, 140)

button_calcular.signal_connect "clicked" do

calcular_debito

end

button_cancelar = Gtk::Button.new :label => "Cancelar"

button_cancelar.set_tooltip_text "Volver al Menu Anterior"

fixed.put(button_cancelar, 100, 140)

button_cancelar.signal_connect "clicked" do

window.destroy 

end

entry.signal_connect "key-release-event" do |w, e|

on_key_release(w, e)

end
      
window.add(fixed)

window.set_default_size 200, 200

window.set_window_position :center

window.show_all

end

def on_key_release sender, event

@valor = sender.text.to_i

end

def calcular_debito 

if @valor == nil || @valor == 0 

@valor = 0

mensaje = Gtk::MessageDialog.new :parent => self, 

:flags => :destroy_with_parent, :type =>  :warning, 

:buttons_type => :close, :message => "Tipo de dato no soportado o igualdad es: '0'"

mensaje.run

mensaje.destroy

on_debito

end

if @valor == 0

window2 = Gtk::Window.new

window2.destroy

else

@resultado = @valor.to_i / 1.21

@iva = @valor - @resultado

window2 = Gtk::Window.new

window2.override_background_color :normal, Gdk::RGBA::new(1.2, 2.3, 3.4, 1)

window2.border_width = 10

window2.title = "IVA Debito"

window2.signal_connect('delete_event') { false }

fixed = Gtk::Fixed.new

label = Gtk::Label.new "El valor sin IVA es: $#{@resultado}"

fixed.put label, 5, 10

label2 = Gtk::Label.new "El IVA es: $#{@iva}"

fixed.put label2, 5, 50

salir2 = Gtk::Button.new :label =>'Aceptar'

salir2.set_size_request 80, 35    

salir2.set_tooltip_text "Volver al menu anterior"
  
fixed.put salir2, 55, 140

@valor = nil

salir2.signal_connect "clicked" do 

window2.destroy

end

window2.add(fixed)

window2.set_default_size 200, 200

window2.set_window_position :center

window2.show_all

end

end