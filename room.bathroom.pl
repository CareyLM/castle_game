#!/usr/bin/perl
#use warnings;

#part of THE CASTLE text based game 

#This is the bathroom
#items: mirror, sink, toilet, shower
#stuff: towel, soap, [password written on mirror]
#starting conditions: no steam
#This room is attached to: upstairs

sub bathroom_command {
	#print a prompt 
    print ">";
    $command = <STDIN>;
	#remove trailing \n
    chomp($command);
	#shift all upper case to lower 
    $command =~ tr/A-Z/a-z/;

#Commands specific to this room

    if ($command eq "room"){
        print "You are in The Bathroom\n";
        command();
    }

    if ($command eq "items"){
        print "The room contains a sink, a shower, a toilet and a mirror\n";
        print "It has one door\n";
        command();
    }

   elsif ($command eq "search" || $command eq "search room"){
	print "You search the bathroom\n";
        # plus 1 to tired level 
        $tired ++;
	sleep (1);
	if ($inventory{"towel"} == 1){
	    print "You find nothing of interest\n";
	    command();
	}
	else {
            print "There is a towel on a hook on the back of the door\n";
	    sleep (1);
            print "Take towel?\n";
	    $answer = <STDIN>;
            chomp($answer);
            $answer =~ tr/A-Z/a-z/;
	    if ($answer eq "y" || $answer eq "yes"){
                print "You take the towel\n";
	        $inventory{"towel"} = 1;
                $load = $load + 0.5; 
	        command();
	    }
	    else {
                print "You leave the towel on the door\n";
	        command();
            }
	}
    }

    if ($command =~ "door" |"exit" |"leave" |"return"){
        print "You leave the bathroom and return to the upstairs hallway\n\n";
        $room = "upstairs";
        command();
    }

    if ($command =~ "toilet"){
        print "'Yep, that's a toilet'\n";
        command();
    }

   elsif ($command =~ "sink"){
	print "You take a closer look at the sink\n";
	sleep (1);
	if ($inventory{"soap"} == 1){
	    print "There's nothing there\n";
	    command();
	}
	else {
            print "There is a piece of soap on the side of the sink\n";
	    sleep (1);
            print "Take soap?\n";
	    $answer = <STDIN>;
            chomp($answer);
            $answer =~ tr/A-Z/a-z/;
	    if ($answer eq "y" || $answer eq "yes"){
                print "You put the soap in your pocket\n";
	        $inventory{"soap"} = 1;
                $load = $load + 0.2; 
	        command();
	    }
	    else {
                print "You leave the soap by the sink\n";
	        command();
            }
	}
    }

    if ($command =~ "mirror"){
        print "There is a mirror hanging above the sink\n";
        if ($steam = "yes"){
	    sleep (1);
	    print "The mirror is steamed up\n";
	    sleep (1);
	    print "You can make out faint writing in the steam\n";
	    sleep (1);
	    print "It says:\n";
	    print "THE PASSWORD IS SWORDFISH\n";
            command();
	}
	else{
	    command();
	}
    }

    if ($command =~ "shower" && $command =~ "on"){
        print "You turn the shower on\n";
	$shower = "on";
	$steam = "yes";
	command();
    }

    if ($command =~ "shower" && $command =~ "off"){
        print "You turn the shower off\n";
	$shower = "off";
	command();
    }

    if ($command =~ "shower"){
        if ($shower = "on"){
	    print "The shower is turned on\n";
            command();
	}
	else{
	    print "The shower is turned off\n";
	    command();
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

    elsif ($command eq "hint") {
        print "Try turning the shower on and off\n";
        print "Have you looked at the mirror?\n";
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
	print "\tshower?\n";
	print "\tsink?\n";
	print "\ttoilet?\n";
	print "\tmirror?\n";
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
