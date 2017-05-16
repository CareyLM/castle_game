#!/usr/bin/perl
#use warnings;

#part of THE CASTLE text based game 

#This is the tower room
#items: table, bed, chest
#stuff: knife, key1, key2
#starting conditions: chest is locked, door out is locked
#This room is attached to: hall, garden (if wearing cloak)

sub tower_command {
	#print a prompt 
    print ">";
    $command = <STDIN>;
	#remove trailing \n
    chomp($command);
	#shift all upper case to lower 
    $command =~ tr/A-Z/a-z/;

#Commands specific to this room
    if ($command eq "room"){
        print "You are in The Tower\n";
        command();
    }

    if ($command eq "items"){
        print "The room contains a bed, a woodern chest and a table\n";
        print "It has one window and one door\n";
        command();
    }

    elsif ($command =~ "climb"){
        print "Are you sure you want to climb out the window?\n";
	$answer = <STDIN>;
        chomp($answer);
        $answer =~ tr/A-Z/a-z/;
	if ($answer eq "y" || $answer eq "yes"){
                print "You attempt to climb out the window\n";
                sleep (1);
                print "Your foot slips...\n";
                sleep (1);
                print "You fall to your death\n";
		sleep (1);
                print "GAME OVER\n";
                sleep (3);
	        exit;
	}
	else {
	        command();
        }
    }
    
   elsif ($command =~ "search" || $command eq "look for key" || $command eq "find key" || $command =~ "hunt"){
	print "You search the entire room...\n";
        # plus 1 to tired level 
        $tired ++;
	sleep (1);
	if ($inventory{"key1"} == 1){
	    print "There is nothing to find\n";
	    command();
	}
	else {
            print "You find a small key on the floor under the bed\n";
	    sleep (1);
            print "Take key?\n";
	    $answer = <STDIN>;
            chomp($answer);
            $answer =~ tr/A-Z/a-z/;
	    if ($answer eq "y" || $answer eq "yes"){
                print "You pick up the key and put it in your pocket\n";
	        $inventory{"key1"} = 1;
                $load = $load + 0.2; 
	        command();
	    }
	    else {
                print "'Nah, let's leave it, why would we need a key?'\n";
	        command();
            }
	}
    }	

    elsif ($command =~ "jump") {
	print "You jump out the window\n";
        sleep (1);
        print "You fall to your death\n";
        sleep (1);
        print "GAME OVER\n";
        sleep (3);
	exit;
    }

    elsif ($command =~ "kick" && $command =~ "door") {
	print "You kick the door as hard as you can\n";
        sleep (1);
        print "OUCH!\n";
        sleep (1);
        print "You've broken your foot\n";
	$inventory{"brokenf"} = 1;
        $health = $health - 5;
	command();
    }

    elsif ($command =~ "hide") {
        print "You hide under the table\n";
        sleep (1);
        print "Time passes...\n";
	sleep (1);
        print "Would you like to come out from there?\n";
	$answer = <STDIN>;
        chomp($answer);
        $answer =~ tr/A-Z/a-z/;
	if ($answer eq "y" || $answer eq "yes"){
                print "You get out from under the table\n";
	        command();
	}
	else {
                print "You remain hidden under the table for several hours\n";
		sleep (2);
		print "...\n";
		sleep (2);
		print "...\n";
		sleep (2);
		print "Eventually you get bored and crawl out from under the table\n";
	        command();
        }
    }

    elsif ($command =~ "bed" && $command ne "take bed") {
        print "That bed looks very comfortable\n";
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

    elsif ($command =~ "window") {
	print "You go and look out the window\n";
        sleep (1);
	print "It's a long way down\n";
        command();
    }

    elsif ($command =~ "chest" && ($command =~ "smash" || "kick") {
        print "You smash open the chest\n";
 	    sleep (1);
            if ($inventory{"key2"} == 1){
 
	        print "The chest is empty\n";
	        command();
            }
	    else {
                print "Inside the chest is a large rusty key\n";
	        sleep (1);
                print "Take key?\n";
	        $answer = <STDIN>;
                chomp($answer);
                $answer =~ tr/A-Z/a-z/;
	        if ($answer eq "y" || $answer eq "yes"){
                    print "You pick up the key and put it in your pocket\n";
	            $inventory{"key2"} = 1;
                    $load = $load + 0.4;
	            command();
	        }
	        else {
                   print "'I have enough keys'\n";
	           command();
                }
            }
    }

    elsif ($command =~ "chest" && $command ne "take chest") {
        print "The large woodern chest at the foot of the bed is locked\n";
        if ($inventory{"key1"} == 1) {
	    print "You unlock the chest using the small key\n";
	    sleep (1);
            if ($inventory{"key2"} == 1){
 
	        print "The chest is empty\n";
	        command();
            }
	    else {
                print "Inside the chest is a large rusty key\n";
	        sleep (1);
                print "Take key?\n";
	        $answer = <STDIN>;
                chomp($answer);
                $answer =~ tr/A-Z/a-z/;
	        if ($answer eq "y" || $answer eq "yes"){
                    print "You pick up the key and put it in your pocket\n";
	            $inventory{"key2"} = 1;
                    $load = $load + 0.4;
	            command();
	        }
	        else {
                   print "'I have enough keys'\n";
	           command();
                }
            }
	}
        else {
             command();
        }
    }

    elsif ($command =~ "table" && $command ne "take table") {
        print "You take a closer look at the table\n";
        sleep (1);
        if ($inventory{"knife"} == 1){
	    print "There is nothing there\n";
	    command();
	}
	else {
            print "There is a small knife lying on the table\n";
	    sleep (1);
            print "Take knife?\n";
	    $answer = <STDIN>;
            chomp($answer);
            $answer =~ tr/A-Z/a-z/;
	    if ($answer eq "y" || $answer eq "yes"){
                print "You pick up the knife and put it in your pocket\n";
	        $inventory{"knife"} = 1;
                $load = $load + 0.7;
	        command();
	    }
	    else {
                print "'No... no knives today'\n";
	        command();
            }
	}	
        command();
    }

    elsif ($command =~ "floor") {
        print "The foor is made of wood, how exciting!\n";
        command();
    }

    elsif ($command =~ "walls") {
        print "The walls are bare stone... brrr...\n";
        command();
    }

    elsif ($command =~ "key") {
        if ($inventory{"key1"} == 1) {
            if ($inventory{"key2"} == 1) {
            print "You take your two keys out of your pocket and look at them\n";
            print "What do you want to do with them?\n";
            command();
            }
            else {
            print "You take the small key out of your pocket\n";
            print "What do you want to do with it?\n";
            command();
            }
	}
	else {
            if ($inventory{"key2"} == 1) {
            print "You take the large rusty key from your pocket\n";
            print "What do you want to do with it?\n";
            command();
            }
            else {
            print "You don't have any keys\n";
            command();
            }
        }
    }

    elsif ($command eq "take bed") {
        print "You can't take that with you, it's too heavy\n";
        command();
    }

    elsif ($command eq "take table") {
        print "You can't take that with you, it's too heavy\n";
        command();
    }

    elsif ($command eq "take chest") {
        print "You can't take that with you, it's too heavy\n";
        command();
    }

    elsif ($command =~ "shout") {
        print "You shout!\n";
        sleep (2);
        print "There is no response\n";
        command();
    }

    elsif ($command eq "die") {
        print "Overcome by despair you fling yourself from the window\n";
        sleep (1);
        print "You fall to your death\n";
        sleep (1);
        print "GAME OVER\n";
        sleep (3);
	exit;
    }

#opening the door 
    elsif ($command =~ "door") {
	    print "You try to open the door...\n";
	    sleep (1);
	    while ($door_lock eq "locked"){
		print "The door is locked\n";
		print "Unlock it?\n";
		$answer = <STDIN>;
		chomp($answer);
		$answer =~ tr/A-Z/a-z/;
		if ($answer eq "y" || $answer eq "yes"){ #unlocking the door
		    if ($inventory{"key2"} == 1){#is key2 in the inventory?
			print "You unlock the door\n";
			$door_lock = "unlocked";
			$done{"door"} = 1; 	#add achievement
			$score ++;		#increase score by 1		
                        command(); #this line needs improvement
                    }
		    else {
			print "You can't unlock the door, you don't have the right key\n";
		        command();
		    } 
		}
		else {
		    print "Let's leave it locked for now\n";
		    command();	
		}		
	    }
            print "The door is unlocked\nYou open it to reveal a dark stairway leading down\n";
            print "Would you like to leave the room?\n";
	    $answer = <STDIN>;
            chomp($answer);
            $answer =~ tr/A-Z/a-z/;
	    if ($answer eq "y" || $answer eq "yes"){
                print "You leave the room and decend the stairs\n\n";
 		#move on to next room
		print "At the foot of the stair is a dark hallway with three doors\n";
		$room = "hall"; 
	        command();
	    }
	    else {
	        print "You decide to stay in the room for now\n";
	        command();
            }
    }
  
    elsif ($command =~ "leave"){
        if ($door_lock eq "unlocked"){
            print "You leave the room and decend the stairs\n\n";
	    print "At the foot of the stair is a dark hallway with three doors\n";
	    $room = "hall";        
	    command();
	}
        else {
	    print "You can't leave, the door is locked\n";
	    command();
        }   
    }

    elsif ($command eq "hint") {
        print "Try typing 'search' to look for a key\n";
        print "Have you looked in the chest?\n";
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
	print "\ttable?\n";
	print "\tchest?\n";
	print "\twindow?\n";
	print "\tdoor?\n";
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
