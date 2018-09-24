def on_about
  
about = Gtk::AboutDialog.new

about.override_background_color :normal, Gdk::RGBA::new(1.2, 2.3, 3.4, 1)

about.set_program_name "IVA CALC"

about.set_version "3.0.4"

about.set_copyright "Copyright (C) 2018 Axel Luna - Heavenly Software"

about.set_comments "Pequeña utilidad para calculo de IVA debito e IVA credito, desarrollada en el lenguaje de programación RUBY"
     
begin 

logo = GdkPixbuf::Pixbuf.new :file => "Data/ruby.png"

about.set_logo logo

rescue IOError => e

puts e

puts ("no se pudo cargar las imagenes".upcase)

end
        
about.run

about.destroy

end