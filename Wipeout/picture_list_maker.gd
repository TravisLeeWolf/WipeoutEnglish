extends Node

var FOLDERS = {
	"animals": "res://pictures/animals/",
	"colors": "res://pictures/colors/",
	"days": "res://pictures/days/",
	"feelings": "res://pictures/feelings/",
	"fruits": "res://pictures/fruits/",
	"months": "res://pictures/months/",
	"numbers": "res://pictures/numbers/",
	"sports": "res://pictures/sports/",
	"stationary": "res://pictures/stationary/",
	"weather": "res://pictures/weather/",
}

var pictures = {
	"animals": [
		"res://pictures/animals/animalface_araiguma.png",
		"res://pictures/animals/animalface_buta.png",
		"res://pictures/animals/animalface_coala.png",
		"res://pictures/animals/animalface_duck.png",
		"res://pictures/animals/animalface_inoshishi.png",
		"res://pictures/animals/animalface_inu.png",
		"res://pictures/animals/animalface_kangaroo.png",
		"res://pictures/animals/animalface_kirin.png",
		"res://pictures/animals/animalface_kitsune.png",
		"res://pictures/animals/animalface_kuma.png",
		"res://pictures/animals/animalface_lion.png",
		"res://pictures/animals/animalface_neko.png",
		"res://pictures/animals/animalface_nezumi.png",
		"res://pictures/animals/animalface_niwatori.png",
		"res://pictures/animals/animalface_panda.png",
		"res://pictures/animals/animalface_penguin.png",
		"res://pictures/animals/animalface_saru.png",
		"res://pictures/animals/animalface_tora.png",
		"res://pictures/animals/animalface_uma.png",
		"res://pictures/animals/animalface_usagi.png",
		"res://pictures/animals/animalface_ushi.png",
		"res://pictures/animals/animalface_zou.png",
	],
	"colors": [
		"res://pictures/colors/pen_iroenpitsu01_red.png",
		"res://pictures/colors/pen_iroenpitsu02_orange.png",
		"res://pictures/colors/pen_iroenpitsu03_yellow.png",
		"res://pictures/colors/pen_iroenpitsu04_lime.png",
		"res://pictures/colors/pen_iroenpitsu05_green.png",
		"res://pictures/colors/pen_iroenpitsu06_skyblue.png",
		"res://pictures/colors/pen_iroenpitsu07_blue.png",
		"res://pictures/colors/pen_iroenpitsu08_purple.png",
		"res://pictures/colors/pen_iroenpitsu09_brown.png",
		"res://pictures/colors/pen_iroenpitsu10_white.png",
		"res://pictures/colors/pen_iroenpitsu11_gray.png",
		"res://pictures/colors/pen_iroenpitsu12_black.png",
		"res://pictures/colors/pen_iroenpitsu13_pink.png",
	],
	"days": [
		"res://pictures/days/week1_mon.png",
		"res://pictures/days/week2_tue.png",
		"res://pictures/days/week3_wed.png",
		"res://pictures/days/week5_fri.png",
		"res://pictures/days/week5_thu.png",
		"res://pictures/days/week6_sat.png",
		"res://pictures/days/week7_sun.png",
	],
	"feelings": [
		"res://pictures/feelings/akubi_girl.png",
		"res://pictures/feelings/happy_man6.png",
		"res://pictures/feelings/kodomosyokudou_hungry_girl.png",
		"res://pictures/feelings/pose_genki03_man.png",
		"res://pictures/feelings/tsukare_boy.png",
	],
	"fruits": [
		"res://pictures/fruits/fruit_banana.png",
		"res://pictures/fruits/fruit_coconut_half.png",
		"res://pictures/fruits/fruit_grape_gorby.png",
		"res://pictures/fruits/fruit_kiwi_green.png",
		"res://pictures/fruits/fruit_peach.png",
		"res://pictures/fruits/fruit_pineapple.png",
		"res://pictures/fruits/fruit_ringo.png",
		"res://pictures/fruits/furit_mark01_suika.png",
		"res://pictures/fruits/furit_mark02_melon.png",
		"res://pictures/fruits/furit_mark05_lemon.png",
		"res://pictures/fruits/furit_mark11_ichigo.png",
		"res://pictures/fruits/furit_mark17_cherry.png",
		"res://pictures/fruits/furit_mark18_mikan.png",
	],
	"months": [
		"res://pictures/months/tsuki_title01.png",
		"res://pictures/months/tsuki_title02.png",
		"res://pictures/months/tsuki_title03.png",
		"res://pictures/months/tsuki_title04.png",
		"res://pictures/months/tsuki_title05.png",
		"res://pictures/months/tsuki_title06.png",
		"res://pictures/months/tsuki_title07.png",
		"res://pictures/months/tsuki_title08.png",
		"res://pictures/months/tsuki_title09.png",
		"res://pictures/months/tsuki_title10.png",
		"res://pictures/months/tsuki_title11.png",
		"res://pictures/months/tsuki_title12.png",
	],
	"numbers": [
		"res://pictures/numbers/number_0.png",
		"res://pictures/numbers/number_1.png",
		"res://pictures/numbers/number_2.png",
		"res://pictures/numbers/number_3.png",
		"res://pictures/numbers/number_4.png",
		"res://pictures/numbers/number_5.png",
		"res://pictures/numbers/number_6.png",
		"res://pictures/numbers/number_7.png",
		"res://pictures/numbers/number_8.png",
		"res://pictures/numbers/number_9.png",
		"res://pictures/numbers/number_10.png",
	],
	"sports": [
		"res://pictures/sports/basketball_boys.png",
		"res://pictures/sports/paralympic_swimming.png",
		"res://pictures/sports/rikujou_man_tankyori.png",
		"res://pictures/sports/skate_figure_pair.png",
		"res://pictures/sports/ski_crosscountry.png",
		"res://pictures/sports/sports_badminton_woman.png",
		"res://pictures/sports/sports_baseball_man_india.png",
		"res://pictures/sports/sports_dodgeball_boy_girl.png",
		"res://pictures/sports/sports_soccer_man_black.png",
		"res://pictures/sports/sports_softball_woman.png",
		"res://pictures/sports/sports_tennis_woman_asia.png",
		"res://pictures/sports/sports_volleyball_woman_atack.png",
		"res://pictures/sports/takkyu_tabletennis_man.png",
	],
	"stationary": [
		"res://pictures/stationary/book_nikkichou_diary.png",
		"res://pictures/stationary/bunbougu_ballpen.png",
		"res://pictures/stationary/bunbougu_enpitsukeduri.png",
		"res://pictures/stationary/bunbougu_fudebako.png",
		"res://pictures/stationary/bunbougu_hasami.png",
		"res://pictures/stationary/bunbougu_hochikisu.png",
		"res://pictures/stationary/bunbougu_jougi.png",
		"res://pictures/stationary/bunbougu_keshigomu.png",
		"res://pictures/stationary/bunbougu_serote-pu.png",
		"res://pictures/stationary/bunbougu_sticknori.png",
		"res://pictures/stationary/calender_takujou.png",
		"res://pictures/stationary/iroenpitsu.png",
		"res://pictures/stationary/omocha_kureyon.png",
		"res://pictures/stationary/pen_enpitsu_mark.png",
		"res://pictures/stationary/pen_marker_set_open.png",
		"res://pictures/stationary/school_kokubankeshi.png",
	],
	"weather": [
		"res://pictures/weather/window01_hare.png",
		"res://pictures/weather/window05_kumori.png",
		"res://pictures/weather/window06_ame.png",
		"res://pictures/weather/window08_yuki.png",
		"res://pictures/weather/window09_kaze.png",
		"res://pictures/weather/window10_arashi.png",
	],
}

func _ready():
	pass
#	for name in FOLDERS:
#		add_pics_to_list(pictures[name], FOLDERS[name])

func add_pics_to_list(list, path):
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "" and not list.has(file_name):
			if file_name.ends_with(".png"):
				list.append(path + file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
