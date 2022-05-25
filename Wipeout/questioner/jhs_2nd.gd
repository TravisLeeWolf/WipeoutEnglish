extends Node

# For adding a new question
#{"question": "",
#	"translation": "",
#	"img_url": "",
#	"tags": [], "chapter": 0},

var questions = [
	{"question": "If it is clear, ~",
	"translation": "もし天気がよければ、私たちは野球をするつもりです。",
	"img_url": "https://2.bp.blogspot.com/-MiwjOj9wUCU/VyNdyBB6cLI/AAAAAAAA6Pg/PWIW9l-SF-Y87qvNT6QkdXS0lMAw4abOQCLcB/s800/window01_hare.png",
	"tags": [], "chapter": 1},
	{"question": "Tom went to the park ~",
	"translation": "トムはバレーボールをするために公園へ行きました。",
	"img_url": "https://1.bp.blogspot.com/-zqnT6rZaC2Q/X7zMj7V4haI/AAAAAAABcdU/K1kCirVJ610kbsIwsap0hFGLDNj_zgQ4wCNcBGAsYHQ/s180-c/sports_volleyball_man_recieve.png",
	"tags": ["to ~"], "chapter": 2},
	{"question": "~ in this town.",
	"translation": "この町に大きな公園があります。",
	"img_url": "https://2.bp.blogspot.com/-t8-webWBL94/UZB7jgDTpVI/AAAAAAAASFk/qkmgqebrJnw/s180-c/tatemono_kouen.png",
	"tags": ["There is / There are"], "chapter": 3},
	{"question": "~ a wallet.",
	"translation": "私は彼に財布をあげるつもりです。",
	"img_url": "https://2.bp.blogspot.com/--l6pTSb0Rio/XAnwDz9fDwI/AAAAAAABQts/fmk0-EPOkBs8qEHbW1koMl5SHfsYB5cNgCLcBGAs/s180-c/otoshimono_todokeru_girl_ekiin.png",
	"tags": ["I will"], "chapter": 4},
	{"question": "The Amazon ~ in South America.",
	"translation": "アマゾン川は南アフリカでいちばん長いです。",
	"img_url": "http://4.bp.blogspot.com/-yVOmc871O5g/UpGGYyWFqoI/AAAAAAAAa4g/_QMme7XMRo0/s180-c/kawa.png",
	"tags": ["er / est"], "chapter": 5},
	{"question": "Miki ~ since 2016.",
	"translation": "美紀はこの町に２０１６年からずっと住んでいます。",
	"img_url": "http://1.bp.blogspot.com/-sZWA3X8pMbw/VMItlsBbM2I/AAAAAAAAqvo/gqyqv86WK4E/s180-c/myhome_family_kengaku.png",
	"tags": ["have ~ / has ~"], "chapter": 6},
	{"question": "I have not ~ yet.",
	"translation": "私はまだ昼食を終えていません。",
	"img_url": "https://1.bp.blogspot.com/-R_DLArY0yMw/WFo_VRtPu_I/AAAAAAABAlI/yV2ZWSM7beEq0w7n0SMRy7s8TW7B8zJTQCLcB/s180-c/syokuji_black_man.png",
	"tags": ["have ~ed"], "chapter": 7},
	{"question": "~ try on this shirt?",
	"translation": "このシャツを試着してもいいですか。",
	"img_url": "http://2.bp.blogspot.com/-u5xvv0eG2I8/UUhH83z-ydI/AAAAAAAAO6E/0CWK1V-ZVGw/s180-c/shopping_sale.png",
	"tags": ["May / Could"], "chapter": 0},
	{"question": "We don't ~ until Monday.",
	"translation": "私たちはエッセイを書かなくてはなりません。",
	"img_url": "https://4.bp.blogspot.com/-HGB-tsWvCKM/V7kvOYtkrbI/AAAAAAAA9IA/A3hbQW49iIYcvWEcBsYXSAbGX4RJ316QwCLcB/s180-c/syukudai_natsuyasumi_girl.png",
	"tags": ["have to / must"], "chapter": 0},
]

var questions_to_ask: Array = []

func _ready():
	add_to_question_list()


func add_to_question_list():
	for question in questions:
		questions_to_ask.append([question["question"], question["img_url"], question["tags"], question["translation"]])
	for question in questions:
		questions_to_ask.append([question["translation"], question["img_url"], question["tags"], question["question"]])





