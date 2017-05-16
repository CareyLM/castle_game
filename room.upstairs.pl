#!/usr/bin/perl
#use warnings;

#part of THE CASTLE text based game 

#This is the upstairs room
#items: picture 
#stuff: key4
#starting conditions: 
#This room is attached to: entrance, bathroom, bedroom

sub upstairs_command {
	#print a prompt 
    print ">";
    $command = <STDIN>;
	#remove trailing \n
    chomp($command);
	#shift all upper case to lower 
    $command =~ tr/A-Z/a-z/;

#Commands specific to this room

    if ($command eq "room"){
        print "You are in The Upstairs Hall\n";
        command();
    }

    if ($command eq "items"){
        print "The room contains a picture of a clown riding a T-rex\n";
        print "It has two doors and a staircase leading down\n";
        command();
    }

    elsif ($command =~ "search" || $command eq "find key"){
	print "You search the entire room...\n";
	sleep (1);
        $tired ++;
	if ($inventory{"key4"} == 1){
	    print "There is nothing to find\n";
	    command();
	}
	else {
            print "You find a bunch of keys behind the skirting board\n";
	    sleep (1);
            print "Take key?\n";
	    $answer = <STDIN>;
            chomp($answer);
            $answer =~ tr/A-Z/a-z/;
	    if ($answer eq "y" || $answer eq "yes"){
                print "You pick up the keys and put them in your pocket\n";
	        $inventory{"key4"} = 1;
                $load = $load + 0.4; 
	        command();
	    }
	    else {
                print "'No, we have enough keys'\n";
	        command();
            }
	}	
    } 

    if ($command =~ "door"){
        print "There are two doors leading out of this room\n";
        sleep (1);
        print "Door 1 leads to the bedroom\n";
        print "Door 2 leads to the bathroom\n";
        sleep (1);
        print "Which door do you want? (1/2)\n";
        $choose_door = <STDIN>;
        chomp($choose_door);
        if ($choose_door eq "1"){
            print "You go through into the bedroom\n\n";
            $room = "bedroom";
	    sleep(1);
	    print "At the centre of the room is a large double bed\n";
	    sleep(1);
	    print "Beside the bed stands a carved oak wardrobe\n";
            command();
        }
        elsif ($choose_door eq "2"){
            print "You go through into the bathroom\n\n";
            $room = "bathroom";
	    sleep(1);
	    print "It's tiled in white and black\n";
	    sleep(1);
	    print "There is a sink, a shower, a toilet ans a mirror\n";
            command();
        }
        else { 
            print "You pick neither door and stay in the upstairs hall\n";
            command();
        }
    }

    if ($command =~ "down" || $command =~ "stairs"){
        print "You go down the stairs to the entrance hall\n\n";
        $room = "entrance";
        command();
    }

    elsif ($command eq "take picture") {
	if ($inventory{"picture"} == 1){
	    print "'I swear I took this earlier...'\n";
	    print "'How is it still here?'\n";
	    command();        
        }
	else {
            print "You take the picture\n";
            print "You never know what you might need\n";
            $inventory{"picture"} = 1;
	    $load = $load + 2.0;
            command();
        }
    }

    elsif ($command =~ "shout") {
        print "You shout!\n";
        sleep (2);
        print "There is no response\n";
        command();
    }

    elsif ($command =~ "hide"){
        print "There is nowhere to hide\n";
        command();
    }

    elsif ($command =~ "jump") {
	print "You jump up and down on the spot for a while...\n";
	sleep (1);
	print "That was pointless, what next?\n";
        $tired ++;
	command();
    }

    elsif ($command eq "hint") {
        print "Have you searched this room?\n";
        command();
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
	print "\tpicture?\n";
	command();
    } 

	#rest 
    elsif ($command eq "rest") {
	print "You lie down on the floor and have a have a quick rest\n";
        $tired = $tired - 5;
        $health --;
	command();
    } 

	#wear
    elsif ($command =~ "wear" || $command =~ "put on"){
	wear();
    }

        #help
    elsif ($command eq "help") {
        help();
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
