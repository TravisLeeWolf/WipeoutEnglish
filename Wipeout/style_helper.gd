extends Node
"""
Some notes taken from the GDScript stlye guide to help writing readable code
"""

"""
General layout of code:

01. tool
02. class_name
03. extends
04. # docstring

05. signals
06. enums
07. constants
08. exported variables
09. public variables
10. private variables
11. onready variables

12. optional built-in virtual _init method
13. built-in virtual _ready method
14. remaining built-in virtual methods
15. public methods
16. private methods
"""

"""
Naming conventions:
	
File names: snake_case
Classes and nodes: PascalCase
Functions and variables: snake_case
Private functions/variables: _snake_case
Signals: past_tense
Constants: ALL_CAPS
"""

"""
Static typing examples:
	
var health: int = 0
func heal(amount: int) -> void:
"""
