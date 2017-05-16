#!/usr/bin/perl
#use warnings;

#part of THE CASTLE text based game 

#This is the entrance room
#items: cupboard, rug, coat stand 
#stuff: boots, pipe(in cupboard)
#starting conditions: the front door is locked
#This room is attached to: hall, drive, upstairs

sub entrance_command {
	#print a prompt 
    print ">";
    $command = <STDIN>;
	#remove trailing \n
    chomp($command);
	#shift all upper case to lower 
    $command =~ tr/A-Z/a-z/;

#Commands specific to this room

    if ($command eq "room"){
        print "You are in The Entrance Hall\n";
        command();
    }

    if ($command eq "items"){
        print "The room contains a cupboard, a rug and a coat stand\n";
        print "It has two doors and a staircase leading up\n";
        command();
    }

    if ($command =~ "door"){
        print "There are two doors leading out of this room\n";
        sleep (1);
        print "Door 1 leads into the hall\n";
        print "Door 2 is the main front door of the house\n";
        sleep (1);
        print "Which door do you want? (1/2)\n";
        $choose_door = <STDIN>;
        chomp($choose_door);
        if ($choose_door eq "1"){
            print "You go through into the hall\n";
            $room = "hall";
            command();
        }
        elsif ($choose_door eq "2"){
	    if ($inventory{"key4"} == 1){
		print "You unlock the front door and step outside\n\n";
		$room = "drive";
		print "You are standing on the front drive\n";
		print "The gateway ahead of you appears to have been blocked by a landfall\n";
		print "There are dark woods on either side of the drive\n";
		command();
	    }
	    else {
                print "The front door is locked\n";   
                command();
	    }
	}
        else { 
            print "You pick neither door and stay in the entrance hall\n";
            command();
        }
    }

    elsif ($command =~ "search"){
	print "You search the entire room inch by inch...\n";
        $tired ++;
	sleep (1);
	if ($inventory{"boots"} == 1){
	    print "There is nothing to find\n";
	    command();        
        }
	else {
            print "You find a pair of old boots behind the coat stand\n";
	    sleep (1);
            print "Take boots?\n";
	    $answer = <STDIN>;
            chomp($answer);
            $answer =~ tr/A-Z/a-z/;
	    if ($answer eq "y"){
                print "You take the boots\n";
	        $inventory{"boots"} = 1;
                $load = $load + 1.0;
	        command();
	    }
	    else {
                print "'Ewww... smelly!'\n";
	        command();
            }
	}	
    } 

    elsif ($command eq "take rug" || $command eq "take carpet") {
        print "You can't take that with you, it's too heavy\n";
        command();
    }

    elsif ($command eq "take cupboard") {
        print "You can't take that with you, it's too heavy\n";
        command();
    }

    elsif ($command =~ "cupboard" || $command ne "take cupboard") {
        print "You take a look inside the cupboard\n";
	if ($inventory{"pipe"} == 1){
	    print "It's empty\n";
	    command();        
        }
	else {
            print "At the back of cupboard you find a length of copper pipe\n";
	    sleep (1);
            print "Take pipe?\n";
	    $answer = <STDIN>;
            chomp($answer);
            $answer =~ tr/A-Z/a-z/;
	    if ($answer eq "y"){
                print "You take the pipe\n";
	        $inventory{"pipe"} = 1;
                $load = $load + 1.2;
	        command();
	    }
	    else {
                print "You leave the pipe where you found it, more or less\n";
	        command();
            }
	}	
    }

    elsif ($command =~ "stairs" || $command =~ "up" || $command =~ "staircase"){
        print "You go up the stairs\n\n";
        sleep (1);
        $room = "upstairs";
        $tired = $tired - 2;
        print "You are now in the upstairs hallway\n";
        print "The room appears empty apart from a picture on the wall\n";
        print "There are two doors leading off the hallway\n";
        command();
    }

    elsif ($command eq "take coat stand" || $command eq "take coatstand") {
        print "You can't take that with you, it's too heavy\n";
        command();
    }

    elsif ($command =~ "jump") {
	print "You jump up and down on the spot for a while...\n";
	sleep (1);
	print "That was pointless, what next?\n";
        $tired ++;
	command();
    }

    elsif ($command =~ "hide") {
        print "You hide in the cupboard\n";
        print "It's a bit of a squeeze\n";
        sleep (1);
        print "Time passes...\n";
	sleep (1);
        print "Would you like to come out of there?\n";
	$answer = <STDIN>;
        chomp($answer);
        $answer =~ tr/A-Z/a-z/;
	if ($answer eq "y" || $answer eq "yes"){
                print "You climb out the cupboard and dust yourself off\n";
	        command();
	}
	else {
                print "You remain hidden in the cupboard for several hours\n";
		sleep (2);
		print "...\n";
		sleep (2);
		print "...\n";
		sleep (2);
		print "Eventually you die of thirst\n\n";
		sleep (1);
		print "GAME OVER\n";
		sleep (3);
	        exit;
        }
    }

#These are general commands that should be applied to all rooms

	#opening an inventory 
    elsif ($command =~ "inventory" || $command eq "i") {
        inventory();
    }

        #view stats 
    elsif ($command =~ "stats" || $command eq "s") {
        stats();
    }

	#open list of achievements
    elsif ($command eq "a") {
        done();
    }

	#looking at items 
    elsif ($command eq "look") {
	print "What do you want to look at?\n";
	command();
    } 

	#rest 
    elsif ($command eq "rest") {
	print "You lie down on the floor and have a have a quick rest\n";
        $tired = $tired - 5;
        $health --;
	command();
    } 

        #help
    elsif ($command eq "help") {
        help();
    }

	#wear
    elsif ($command =~ "wear" || $command =~ "put on"){
	wear();
    }

        #quit game
    elsif ($command eq "quit") {
        print "Are you sure you want to quit? y/n";
        $quit = <STDIN>;
        chomp($quit);
        $quit =~ tr/A-Z/a-z/;
        if ($quit eq "y" || $quit eq "yes") {
            print "Quitting...\n";
            exit;
        }
        else {
            print "Not quitting.\n\n";
            command();
        }
    }

#NO UNDERSTANDABLE COMMAND
    else {
	print "I don't understand that command\n";
	command();
    }
}

1;
