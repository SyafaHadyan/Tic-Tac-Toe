extends Node2D

var board = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
var player = 1
var game_over = false

func _input(event):
	if not game_over and event is InputEventMouseButton and event.pressed:
		var row = int((event.position.y - rect_position.y) / 200)
		var col = int((event.position.x - rect_position.x) / 200)
		if board[row][col] == 0:
			board[row][col] = player
			update_board()
			check_win()
			player = -player

func check_win():
	for row in board:
		if row[0] == row[1] and row[1] == row[2] and row[0] != 0:
			display_win_message(row[0])
			return

	for col in range(3):
		if board[0][col] == board[1][col] and board[1][col] == board[2][col] and board[0][col] != 0:
			display_win_message(board[0][col])
			return

	if board[0][0] == board[1][1] and board[1][1] == board[2][2] and board[0][0] != 0:
		display_win_message(board[0][0])
		return

	if board[0][2] == board[1][1] and board[1][1] == board[2][0] and board[0][2] != 0:
		display_win_message(board[0][2])
		return

	if not any(0 in row for row in board):
		display_win_message(None)

func display_win_message(symbol):
	if symbol == None:
		message = "Tie game!"
	else:
		message = "Player " + str(symbol) + " wins!"

	print(message)
	game_over = true
