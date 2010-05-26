require 'rubygems'
require 'irb'

require 'geogebra.jar'
require 'geogebra_main.jar'
require 'geogebra_properties.jar'
require 'geogebra_gui.jar'

App = Java::GeogebraMain::Application
DefaultApp = Java::GeogebraMain::DefaultApplication
DropTarget = Java::JavaAwtDnd::DropTarget
GgbFrame = Java::GeogebraGuiApp::GeoGebraFrame

@wnd = GgbFrame.new
@app = DefaultApp.new([].to_java(:string), @wnd, true)

@app.gui_manager.init_menubar

# Init GUI
@wnd.application=@app
@wnd.content_pane.add @app.build_application_panel
@wnd.drop_target = DropTarget.new(@wnd, Java::GeogebraGui::FileDropTargetListener.new(@app))
@wnd.add_window_focus_listener @wnd
@wnd.java_send :updateAllTitles
#wnd.visible = true

#GeoSetConstructionOrder
def @app.gsco
  kernel.construction.geo_set_construction_order
end

puts 'GeoGebraFrame is stored in @wnd and Application in @app.'
IRB.start
