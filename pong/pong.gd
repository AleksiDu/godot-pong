extends Node2D

# screen values
onready var screenWidth = get_tree().get_root().size.x
onready var screenHeight = get_tree().get_root().size.y
onready var halfScreenWidth = screenWidth/2
onready var halfScreenHeight = screenHeight/2

# ball variables
var ballRadius = 10.0
var ballColor = Color.white

# paddle variables
var paddleColor = Color.white
var paddleSize = Vector2(10.0,100.0)
var halfPaddleHeight = paddleSize.y/2
var paddlePadding = 10.0

# font variables
var font = DynamicFont.new()
var robatoFile = load("Roboto-Light.ttf")
var fontSize = 24
var halfWidthFont
var heighFont
var stringValue = "Hello World!"

# ball variable
onready var ballPosition = Vector2(halfScreenWidth,halfScreenHeight)

# player paddle
onready var playerPosition = Vector2(paddlePadding, halfScreenHeight-halfPaddleHeight)
onready var playerStartPostion = Rect2(playerPosition,paddleSize)
onready var aiPostion = Vector2(screenWidth-(paddlePadding + paddleSize.x),halfScreenHeight - halfPaddleHeight)
onready var aiStartPosition = Rect2(aiPostion, paddleSize)

# string variable
var stringPostion

func _ready() -> void:
	font.font_data = robatoFile
	font.size = fontSize
	halfWidthFont = font.get_string_size(stringValue).x/2
	heighFont = font.get_height()
	stringPostion = Vector2(halfScreenWidth-halfWidthFont, heighFont)
	
func  _physics_process(delta:float) -> void:
	pass

func _draw() -> void:
	setStartingPosition()

func setStartingPosition():
	draw_circle(ballPosition,ballRadius,ballColor)
	draw_rect(playerStartPostion,paddleColor)
	draw_rect(aiStartPosition,paddleColor)
	draw_string(font,stringPostion, stringValue)
