def on_credito

window = Gtk::Window.new

window.override_background_color :normal, Gdk::RGBA::new(1.2, 2.3, 3.4, 1)

window.border_width = 10

window.title = "IVA Credito"

window.signal_connect('delete_event') { false }

fixed = Gtk::Fixed.new

label = Gtk::Label.new "Introduzca el Valor"

fixed.put label, 30, 10

entry = Gtk::Entry.new

fixed.put entry, 10, 60

button_calcular = Gtk::Button.new :label => "Calcular"

button_calcular.set_tooltip_text "Calcular Iva credito"

fixed.put(button_calcular, 10, 140)

button_calcular.signal_connect "clicked" do

calculo_credito

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


def calculo_credito

if @valor == nil || @valor == 0 

@valor = 0

mensaje = Gtk::MessageDialog.new :parent => self, 

:flags => :destroy_with_parent, :type =>  :warning, 

:buttons_type => :close, :message => "Tipo de dato no soportado o igualdad es: '0'"

mensaje.run

mensaje.destroy

on_credito

end

if @valor == 0

window_show = Gtk::Window.new

window_show.destroy

else

@resultado2 = @valor.to_i * 1.21

@iva2 = @resultado2 - @valor

window_show = Gtk::Window.new

window_show.border_width = 10

window_show.override_background_color :normal, Gdk::RGBA::new(1.2, 2.3, 3.4, 1)

window_show.title = "IVA Credito"

window_show.signal_connect('delete_event') { false }

fixed = Gtk::Fixed.new

label = Gtk::Label.new "El valor con IVA es: $#{@resultado2}"

fixed.put label, 5, 10

label_2 = Gtk::Label.new "El IVA es: $#{@iva2}"

fixed.put label_2, 5, 50

@valor = nil

salir_2 = Gtk::Button.new :label =>'Aceptar'

salir_2.set_size_request 80, 35    

salir_2.set_tooltip_text "Volver al menu anterior"
  
fixed.put salir_2, 55, 140

salir_2.signal_connect "clicked" do 

window_show.destroy

end

window_show.add(fixed)

window_show.set_default_size 200, 200

window_show.set_window_position :center

window_show.show_all

end

end