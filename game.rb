require 'dxruby'

#back_img = Image.load("image/back.png")
back = Image.load("image/back3.png")
boal = Image.load("image/boal.png")
arrow = Image.load("image/arrow.png")
Window.width = (450)
Window.height = (600)
a = 0
onpush = 0
time = 0
kakudo = 0
deleteball = 0

#ピン配置
def put_pin
  pin = Image.load("image/pin2.png")
  Window.draw_scale(170, 170, pin, 0.5, 0.5)
  Window.draw_scale(200, 170, pin, 0.5, 0.5)
  Window.draw_scale(230, 170, pin, 0.5, 0.5)
  Window.draw_scale(260, 170, pin, 0.5, 0.5)

  Window.draw_scale(185, 180, pin, 0.5, 0.5)
  Window.draw_scale(215, 180, pin, 0.5, 0.5)
  Window.draw_scale(245, 180, pin, 0.5, 0.5)

  Window.draw_scale(200, 190, pin, 0.5, 0.5)
  Window.draw_scale(230, 190, pin, 0.5, 0.5)

  Window.draw_scale(215, 200, pin, 0.5, 0.5)

end

Window.loop do
  #マウスカーソルの座標を取得
  x = Input.mouse_pos_x  # マウスカーソルのx座標
  y = Input.mouse_pos_y  # マウスカーソルのy座標
  #puts x
  #puts y

  Window.draw_scale(-80*7, -60*5, back, 0.3, 0.5)
  #Window.draw_ex(-10 + 90 * kakudo, 200, arrow, :angle=>90, :alpha=>180, :scalex=>0.5, :scaley=>0.5, :blend=>:alpha)

  #

  #ボールを投げる位置を決める
  if Input.mouse_down?(0)
    onpush = 1
  elsif onpush == 0
    kakudo = Math.sin(a / 180.0 * Math::PI)
    a += 1
    Window.draw_ex(-10 + 90 * kakudo, 200, arrow, :angle=>90, :alpha=>180, :scalex=>0.5, :scaley=>0.5, :blend=>:alpha)
    Window.draw_scale(0 + 90 * kakudo, 300, boal, 0.25, 0.25)
  end

  #ボールを投げる
  if onpush == 1
    Window.draw_scale(0 + 90 * kakudo, 300 - time * 2, boal, 0.25 - time * 0.001, 0.25 - time * 0.001)
    if 300 - time * 2 <= 0
      deleteball = 1
    end
    time += 1
  end

  #ボールを消す
  if deleteball == 1
    onpush = 0
    time = 0
    deleteball = 0
  end

  put_pin()
end