extends Node

var player = null
var level = null
var quest_level = null
var dialog = null
var level_id = 0
var quest_player = null

var quest1_complete = false
var quest2_complete = false
var quest3_complete = false
var quest4_complete = false
var quest5_complete = false
var quest6_complete = false
var quest7_complete = false

var asks = {
	"rose": "none",
	"rose_complete": "Принц: Прощайте\nРоза: Я была глупая. Прости меня и посторайся быть счастливым.",
	"king": "Король: А вот и поданный! Подойди, я хочу тебя рассмотреть.\nПринц: *зевает*\nКороль: Этикет не разрешает зевать в присутствии монарха. Я запрещаю тебе зевать.\nПринц: Я нечаянно. Я долго был в пути и совсем не спал…\nКороль: Ну, тогда я повелеваю тебе зевать.\n...\nКороль: Недавно я потерял свой скипетр в подземелие, приказываю тебе найти его.",
	"king_complete": "Король: Спасибо за скипетр. Приказываю тебе отдохнуть.\nПринц: Я бы отдохнул, но нужно идти.\nКороль: Нет. Приказываю тебе остаться.\nПринц: Мне пора. Больше мне здесь нечего делать.\nКороль(вдогонку): Назначаю тебя послом!",
	"ambitious": "",
	"ambitious_complete": "",
	"snicker": "aa",
	"snicker_complete": "bb",
	"worker": "",
	"worker_complete": "",
	"lamper": "Принц: Добрый день. Почему ты сейчас погасил фонарь?\nФонарщик: Такой уговор. Добрый день.",
	"lapmer_comlete": "sfsaf",
	"geo": "",
	"geo_complete": ""
}


func exit(code=0):
	get_tree().quit(code)


func goto(scene):
	get_tree().change_scene("res://scenes/"+scene+".tscn")


func load_level(level):
	get_tree().change_scene("res://levels/level"+str(level)+".tscn")
	level_id = level
