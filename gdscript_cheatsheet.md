<h2>Variables</h2>

In Godot we create variables like so:

        var number == 2

        print(number)

Notice that we don't have to declare that number is an int, Godot is smart enough to decide what type a variable should be, also notice that we do not need to put semicolons after every line.

If we *did* want to declare the type of a variable(for readability) that can be accomplished like so:

        //put datatype after colon to declare type
        var number : int = 2

        print(number)

We also can observe that printf is renamed print and variables can be directly printed instead of using a %d.

<h2>Conditionals</h2>

Ifs are probably the most important thing in games, because we say if the player does x then game does y.

ifs can be written like this:

    var number = 2
    if number == 1:
        print("Number is 1")
    elif number == 2:
        print("Number is 2")
    else:
        print("Number is not 1 or 2")

Instead of curly braces we use indents, after an if you must indent 1 tab, everything thats indented is "inside" the curly braces. Warning mixing spaces and tabs for indenting will confuse Godot and cause errors.

<h2>Main</h2>

Instead of main we have _ready() this function runs exactly once when the game starts, it is not as usefull in Godot as in C, instead we will be mainly working in _process which runs once **every** frame. Check Input section to see example.

<h2>Input</h2>

Instead of using scanf we can use Input, We will be using Input.is_action_just_pressed:

    //Handles jumping.
	if Input.is_action_just_pressed("space_bar") and is_on_floor():
		velocity.y = JUMP_HEIGHT //change character velocity to go up

