extends Area2D

var x_pos = [16, 0, 16, 32, 48, 0, 16, 32, 48, 0]
var y_pos = [48, 16, 16, 16, 16, 32, 32, 32, 32, 0]
var pieceSize = 16

var x
var y
var value
var opened = false

onready var sprite = $Sprite

func _ready() -> void:
  position.x = x
  position.y = y

func _on_Piece_input_event(_node, event: InputEvent, _shape_idx: int) -> void:
  if event.is_action_pressed("ui_mouse_left"):
    if not opened:
      setOpened()

func setOpened():
  opened = true
  sprite.region_rect = Rect2(x_pos[value], y_pos[value], pieceSize, pieceSize)
