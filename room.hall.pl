#!/usr/bin/perl

#part of THE CASTLE text based game

#This is the hall
#items: 
#stuff: rock
#starting conditions: 
#This room is attached to: tower, library, veranda, entrance 

sub hall_command {
	#print a prompt 
    print ">";
    $command = <STDIN>;
	#remove trailing \n
    chomp($command);
	#shift all upper case to lower 
    $command =~ tr/A-Z/a-z/;

#Commands specific to this room

if ($command eq "room"){
        print "You are in The Hall\n";
        command();
    }

if ($command eq "items"){
        print "The room is empty\n";
        print "It has four doors\n";
        command();
    }

    elsif ($command =~ "search"){
	print "You search the entire room inch by inch...\n";
        $tired ++;
	sleep (1);
	if ($inventory{"rock"} == 1){
	    print "There is nothing to find\n";
	    command();        
        }
	else {
            print "You find nothing but a small lump of rock\n";
	    sleep (1);
            print "Take rock?\n";
	    $answer = <STDIN>;
            chomp($answer);
            $answer =~ tr/A-Z/a-z/;
	    if ($answer eq "y"){
                print "Yay! A pet rock!\n";
	        $inventory{"rock"} = 1;
                $load = $load + 0.8;
	        command();
	    }
	    else {
                print "'Nope, don't want a rock'\n";
	        command();
            }
	}	
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

    elsif ($command =~ "door"){
        print "This room has four doors;\n";
        sleep (1);
        print "One is red, one is blue, one is brown and one is black\n";
        sleep (1);
        print "Which door do you want to pick?\n";
        $choose_door = <STDIN>;
        chomp($choose_door);
        $choose_door =~ tr/A-Z/a-z/;
        if ($choose_door eq "red"){
            print "You go through the red door into the library\n\n";
            sleep (1);
            $room = "library";
            print "The room smells dusty and the walls are lined with bookselves\n";
            print "There is a fireplace on the far wall with a comfy looking chair in front of it\n";
            command();
        }
        elsif ($choose_door eq "blue"){
            print "You go through the blue door onto the veranda\n\n";
            $room = "veranda";
	    sleep (1);
            print "From here you can see out across the sunlit gardens\n";
            command();
        }
        elsif ($choose_door eq "black"){
            print "You go through the black door into a grand entrance hall\n\n";
            $room = "entrance";
	    sleep (1);
            print "There is a cupboard against the wall and a persian rug on the floor\n";
 	    sleep (1);      
            print "There is a staircase leading up to an upper floor\n";
	    sleep (1);
            print "Next to the door is a coat stand\n";
            command();
        }
        elsif ($choose_door eq "brown"){
            print "The brown door leads back to the tower\n";
            sleep (1);
            print "Do you want to go that way?\n";
            $answer = <STDIN>;
            $answer =~ tr/A-Z/a-z/;
            chomp($answer);
            if ($answer eq "y"){
                print "You go back up the stairs to the tower\n";
                $room = "tower";
                command();
            } 
            else { 
                print "You stay in the hall\n";
                command();
            }
        }
        else {
        print "There is no $choose_door door\n";
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
	print "\tthe doors?\n";
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
