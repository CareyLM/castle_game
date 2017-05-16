#!/usr/bin/perl
#use warnings;

#part of THE CASTLE text based game 

#This is the SECRET TUNNEL
#items: 
#stuff: matches
#starting conditions: the hanger door is locked
#This room is attached to: cave, tunnel, library

sub tunnel_command {
	#print a prompt 
    print ">";
    $command = <STDIN>;
	#remove trailing \n
    chomp($command);
	#shift all upper case to lower 
    $command =~ tr/A-Z/a-z/;

#Commands specific to this room

    if ($command eq "room"){
        print "You are in The Secret Tunnel\n";
        command();
    }

    if ($command eq "items"){
        print "The tunnel appears empty\n";
        print "It has three doors\n";
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
