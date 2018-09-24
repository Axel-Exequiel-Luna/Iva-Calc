#!/usr/bin/ruby

require 'gtk3'

require_relative 'Data/data_deb.rb'

require_relative 'Data/data_cred.rb'

require_relative 'Data/about.rb'

class RubyApp < Gtk::Window

	def initialize

		super

		init_ui

	   end

	  def init_ui

	  	override_background_color :normal, Gdk::RGBA::new(1.2, 2.3, 3.4, 4)

	  	set_title "Calculadora de IVA"

	  	signal_connect "destroy" do 

            Gtk.main_quit 

        end

	    fixed = Gtk::Fixed.new

        add fixed

        label = Gtk::Label.new "IVA CALC 3.04"

        font_desc = Pango::FontDescription.new("Arial 15")

        label.override_font(font_desc)

        fixed.put label, 140, 100

        credito = Gtk::Button.new :label =>'Credito'

        credito.set_size_request 80, 35    

        credito.set_tooltip_text "Calcular Iva Credito"
  
        fixed.put credito, 40, 20  

        credito.signal_connect "clicked" do

           on_credito

        end     

        debito = Gtk::Button.new :label =>'Debito'

        debito.set_size_request 80, 35    

        debito.set_tooltip_text "Calcular Iva Debito"
  
        fixed.put debito, 40, 80

        debito.signal_connect "clicked" do

        	on_debito

        end

        acerca = Gtk::Button.new :label =>'Acerca'

        acerca.set_size_request 80, 35    

        acerca.set_tooltip_text "About"
  
        fixed.put acerca, 40, 140

        acerca.signal_connect "clicked" do

            on_about

        end

        salir = Gtk::Button.new :label =>'Salir'

        salir.set_size_request 80, 35    

        salir.set_tooltip_text "Salir de la App"
  
        fixed.put salir, 40, 200

        salir.signal_connect "clicked" do 

            Gtk.main_quit 

        end

        set_default_size 300, 250

        set_window_position :center

        show_all

	  end

end


app = RubyApp.new

Gtk.main
