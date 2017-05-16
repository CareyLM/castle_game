#!/usr/bin/perl
#use warnings;

#part of THE CASTLE text based game 

#This is the study
#items: desk, shelf, chair
#stuff: map, keycard(in desk)
#starting conditions: desk is locked - unlock with key3
#This room is attached to: library, garden

sub study_command {
	#print a prompt 
    print ">";
    $command = <STDIN>;
	#remove trailing \n
    chomp($command);
	#shift all upper case to lower 
    $command =~ tr/A-Z/a-z/;

#Commands specific to this room

    if ($command eq "room"){
        print "You are in The Study\n";
        command();
    }

    if ($command eq "items"){
        print "The room contains a desk, a swivle chair and a shelf above the desk\n";
        print "It has two doors\n";
        command();
    }

#Search

#Door

    if ($command =~ "hall"){
        print "You leave the study and go into the library\n\n";
        $room = "library";
        command();
    }

    if ($command =~ "garden"){
        print "You leave the study and go into the garden\n\n";
        $room = "garden";
        command();
    }

#desk

#chair

#shelf

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
	print "What do you want to look at?\n";  #ADD LIST OF ITEMS
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
        print "Some useful commands; search, look, jump, hide...\n";
        print "Type the name of an item in the room to look more\n closely at it or interact with it\n";
        print "Type items to get a list of all visible items in a\n room\n";
        print "Use 'y' and 'n' to answer questions\n";
        print "Type 'i' for inventory\n";
        print "Type 's' or 'stats' for your statistics\n";
        print "Type 'quit' if you want to exit the game\n";
        command();
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
