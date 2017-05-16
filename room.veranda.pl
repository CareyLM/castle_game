#!/usr/bin/perl
#use warnings;

#part of THE CASTLE text based game 

#This is the veranda
#items: 
#stuff: plant
#starting conditions: 
#This room is attached to: hall, garden

sub veranda_command {
	#print a prompt 
    print ">";
    $command = <STDIN>;
	#remove trailing \n
    chomp($command);
	#shift all upper case to lower 
    $command =~ tr/A-Z/a-z/;

#Commands specific to this room

    if ($command eq "room"){
        print "You are on The Veranda\n";
        command();
    }

    if ($command eq "items"){;
        print "There are steps leading into the garden and a door into the house\n";
        command();
    }

    elsif ($command =~ "search"){
	print "You search the veranda\n";
	sleep (1);
	if ($inventory{"plant"} == 1){
	    print "There is nothing here\n";
	    command();        
        }
	else {
            print "You find a dying swiss cheese plant\n";
	    sleep (1);
            print "Take plant?\n";
	    $answer = <STDIN>;
            chomp($answer);
            $answer =~ tr/A-Z/a-z/;
	    if ($answer eq "y"){
                print "You have a swiss cheese plant\n";
	        $inventory{"plant"} = 1;
                $load = $load + 20.0;
	        command();
	    }
	    else {
                print "'No way! That's heavy!'\n";
	        command();
            }
	}	
    }

    if ($command =~ "door" || $command =~ "house" || $command =~ "inside"){
        print "You go inside the house\n\n";
        $room = "hall";
        command();
    }

    if ($command =~ "garden" || $command =~ "down" || $command =~ "steps"){
        print "You go down the steps into the garden\n\n";
	sleep (1);
	print "You are standing on a patio surrounded by hedges\n";
	sleep (1);
	print "To one side is a bench, on the other, a lemon tree\n";
	sleep (1);
	print "Ahead of you there is a path between the bushes\n";
	print "Behind you is the veranda\n";
	sleep (1);
	print "There is also a door leading directly into the house\n";
	sleep (1);
        $room = "garden";
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
