#!/usr/bin/perl
#use warnings;

#part of THE CASTLE text based game 

#This is the extra bit of garden (south)
#items: pond, bush, tree
#stuff: spade (in pond), gloves, apple (in tree)
#starting conditions: 
#This room is attached to: garden

sub moregarden_command {
	#print a prompt 
    print ">";
    $command = <STDIN>;
	#remove trailing \n
    chomp($command);
	#shift all upper case to lower 
    $command =~ tr/A-Z/a-z/;

#Commands specific to this room

    if ($command eq "room"){
        print "You are in The South Garden\n";
        command();
    }

    if ($command eq "items"){
        print "The garden contains an apple tree, a pond and bushes\n";
        print "There is a path leading back to the rest of the garden\n";
        command();
    }

    if ($command =~ "exit" || $command =~ "leave" || $command =~ "return"){
        print "You return to the patio area\n\n";
        $room = "more_garden";
        command();
    }

    elsif ($command =~ "search"){
	print "You search the garden\n";
	print "You find a pair of gardening gloves in a rose bush\n";
        $tired ++;
	sleep (1);
	if ($inventory{"gloves"} == 1){
	    print "You don't find anything of interest\n";
	    command();        
        }
	else {
            print "You find a pair of gardening gloves\n";
	    sleep (1);
            print "Take goves?\n";
	    $answer = <STDIN>;
            chomp($answer);
            $answer =~ tr/A-Z/a-z/;
	    if ($answer eq "y" || $answer eq "yes"){
                print "You take the gloves\n";
	        $inventory{"gloves"} = 1;
                $load = $load + 0.2;
	        command();
	    }
	    else {
                print "You leave the gloves in the bushes\n";
	        command();
            }
	}	
    }

# tree

# pond

# spade

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
