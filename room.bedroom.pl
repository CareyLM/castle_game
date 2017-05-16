#!/usr/bin/perl
#use warnings;

#part of THE CASTLE text based game 

#This is the bedroom
#items: bed, wardrobe
#stuff: key5, pillow, cloak, hat
#starting conditions: 
#This room is attached to: upstairs

sub bedroom_command {
	#print a prompt 
    print ">";
    $command = <STDIN>;
	#remove trailing \n
    chomp($command);
	#shift all upper case to lower 
    $command =~ tr/A-Z/a-z/;

#Commands specific to this room

    if ($command eq "room"){
        print "You are in The Bedroom\n";
        command();
    }

    if ($command eq "items"){
        print "The room contains a bed, a table and a wardrobe\n";
        print "It has one door and a window\n";
        command();
    }

    if ($command =~ "door" || $command =~ "exit" || $command =~ "leave" || $command =~ "return"){
        print "You leave the bedroom and return to the upstairs hallway\n\n";
        $room = "upstairs";
        command();
    }

   elsif ($command eq "search" || $command eq "search room" || $command eq "find key"){
	print "You search the entire room...\n";
        # plus 1 to tired level 
        $tired ++;
	sleep (1);
	if ($inventory{"key5"} == 1){
	    print "There is nothing to find but dust\n";
	    command();
	}
	else {
            print "You find a gold key on the floor under the bed\n";
	    sleep (1);
            print "Take key?\n";
	    $answer = <STDIN>;
            chomp($answer);
            $answer =~ tr/A-Z/a-z/;
	    if ($answer eq "y" || $answer eq "yes"){
                print "You pick up the key and put it in your pocket\n";
	        $inventory{"key5"} = 1;
                $load = $load + 0.2; 
	        command();
	    }
	    else {
                print "You leave the key where it is\n";
	        command();
            }
	}
    }	

    elsif ($command =~ "bed" && $command ne "take bed") {
        print "That bed looks very comfortable\n";
        print "It has lots of big fluffy pillows\n";
        sleep (1);
        print "Would you like to take a nap?\n";
        $answer = <STDIN>;
        chomp($answer);
        $answer =~ tr/A-Z/a-z/;
	if ($answer eq "y" || $answer eq "yes"){
            print "You lie down and fall to sleep\n";
            sleep (1);
            print "...\n";
            sleep (1);
            print "You wake up half an hour later feeling very rested\n";
            #tired score decreases by 10 
            $tired = ($tired - 10);
	    command();
	}
	else {
            print "'Now is not the time!'\n";
	    command();
        }
    }

    elsif ($command eq "take bed") {
        print "You can't take that with you, it's too heavy\n";
        command();
    }

    elsif ($command =~ "take" && $command =~ "pillow") {
        print "You take one of the pillows from the bed\n";
	$inventory{"pillow"} = 1;
        $load = $load + 0.1; 
        command();
    }

    elsif ($command =~ "hide") {
        print "You hide under the bed\n";
        sleep (1);
        print "Time passes...\n";
	sleep (1);
        print "Would you like to come out from there? It's rather dusty\n";
	$answer = <STDIN>;
        chomp($answer);
        $answer =~ tr/A-Z/a-z/;
	if ($answer eq "y" || $answer eq "yes"){
                print "You get out from under the bed\n";
	        command();
	}
	else {
                print "You remain hidden under the bed for several hours\n";
		sleep (2);
		print "...\n";
		sleep (2);
		print "...\n";
		sleep (2);
		print "Eventually you get bored and crawl out from under the bed\n";
	        command();
        }
    }

    elsif ($command eq "take wardrobe") {
        print "You can't take that with you, it's too heavy\n";
        command();
    }

    elsif ($command =~ "wardrobe" || $command =~ "open") {
        print "You open the wardrobe\n";
        print "Inside it are a long cloak and a pointy hat\n";
        command();
    }

    elsif ($command =~ "wardrobe") {
        print "'What a nice wardrobe'\n";
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
	print "\tbed?\n";
	print "\twardrobe?\n";
	print "\twindow?\n";
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
