require 'dxruby'

font = Font.new(32) # 追加

Window.loop do
    Window.draw_font(100, 100, "テスト", font) # 追加
end