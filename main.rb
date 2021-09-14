require 'dxruby'

player_img = Image.load("image/player.png")
x = 100
y = 100 # 追加

Window.loop do
  x = x + Input.x # 追加
  y = y + Input.y # 追加
  Window.draw(x, y, player_img) # 書き換え
end