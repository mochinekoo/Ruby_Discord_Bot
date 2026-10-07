# frozen_string_literal: true
require 'libui'

class WindowManager

  UI = LibUI
  WINDOW_TITLE = 'Ruby Discord Bot'

  def self.init_event
    UI.window_on_closing(@main_window) do
      puts 'ウインドウが閉じられました'
      UI.control_destroy(@main_window)
      UI.quit
      0
    end
  end

  def self.init_ui
    box = UI.new_vertical_box
    UI.window_set_child(@main_window, box)
  end

  def self.init()
    UI.init
    @main_window = UI.new_window(WINDOW_TITLE, 1000, 500, 0)
    init_event
    init_ui

    UI.control_show(@main_window)
    UI.main
    UI.quit
  end
end
