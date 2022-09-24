extends Node2D

var piece = preload("res://scenes/Piece.tscn")

var width = 9
var height = 10
var bombs = 10
var data = []

var pieceSize = 16

func _ready() -> void:
  randomize()
  generateBoard()
  addBombs()
  setPieceValues()
  drawPieces()
  print(data)

func generateBoard() -> void:
  for i in range(width):
    data.append([])
    for _j in range(height):
      data[i].append(0)

func addBombs() -> void:
  for _b in range(bombs):
    var bx = randi() % width
    var by = randi() % height

    while true:
      if data[bx][by] == -1:
        bx = randi() % width
        by = randi() % height
      else:
        data[bx][by] = -1
        break

func setPieceValues() -> void:
  for i in range(width):
    for j in range(height):
      if data[i][j] != -1:
        setPieceValue(i, j)

func setPieceValue(x, y):
  if x > 1:
    # up left
    if y > 0 and data[x - 1][y - 1] == -1:
      data[x][y] += 1

    # left
    if data[x - 1][y] == -1:
      data[x][y] += 1

    # down left
    if y < height - 1 and data[x - 1][y + 1] == -1:
      data[x][y] += 1

  if x < width - 1:
    # up right
    if y > 0 and data[x + 1][y - 1] == -1:
      data[x][y] += 1

    # right
    if data[x + 1][y] == -1:
      data[x][y] += 1

    # down right
    if y < height - 1 and data[x + 1][y + 1] == -1:
      data[x][y] += 1

  if y > 1:
    # up
    if data[x][y - 1] == -1:
      data[x][y] += 1

  if y < height - 1:
    # down
    if data[x][y + 1] == -1:
      data[x][y] += 1

func drawPieces() -> void:
  for i in range(width):
    for j in range(height):
      var instance = piece.instance()
      instance.x = i
      instance.y = j
      instance.position = Vector2(i * pieceSize, j * pieceSize)
      instance.value = data[i][j]
      add_child(instance)
