#!/usr/bin/perl
#use warnings;

#part of THE CASTLE text based game 

#This is the drive
#items: signpost
#stuff: key3
#starting conditions: rockfall blocks gate
#This room is attached to: entrance, woods

sub drive_command {
	#print a prompt 
    print ">";
    $command = <STDIN>;
	#remove trailing \n
    chomp($command);
	#shift all upper case to lower 
    $command =~ tr/A-Z/a-z/;

#Commands specific to this room

    if ($command eq "room"){
        print "You are on The Drive\n";
        command();
    }

    if ($command eq "items"){
        print "There are woods on either side and a signpost beside the gate\n";
        print "There is a door leading into the house and a gate leading out of the grounds\n";
        command();
    }

   # if ($command =~ "door" |"exit" |"leave" |"return"){
    #    print "You leave the bathroom and return to the upstairs hallway\n\n";
  #      $room = "upstairs";
  #      command();
 #   }

    elsif ($command =~ "search"){
	print "You search the drive in great detail\n";
	print "Sifting through the gravel is very time consuming\n";
        $tired ++;
	sleep (1);
	if ($inventory{"key3"} == 1){
	    print "You don't find anything of interest\n";
	    command();        
        }
	else {
            print "You find a silver key labled 'desk'\n";
	    sleep (1);
            print "Take key?\n";
	    $answer = <STDIN>;
            chomp($answer);
            $answer =~ tr/A-Z/a-z/;
	    if ($answer eq "y" || $answer eq "yes"){
                print "You take the key and put it in your pocket\n";
	        $inventory{"key3"} = 1;
                $load = $load + 0.2;
	        command();
	    }
	    else {
                print "You leave the key on the drive\n";
	        command();
            }
	}	
    } 

    elsif ($command eq "take signpost" || $command eq "take sign") {
        print "You can't take that with you, it's too heavy, and it's attached to the ground!\n";
        command();
    }

    elsif ($command =~ "sign"){
        print "You take a closer look at the signpost\n";
        print "It reads 'BEWARE OF THE GIANT MAN-EATING MONSTER'\n";
        print "'How curious...'\n";
        command();
    }

# go inside

# go into woods 

# hide

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
	print "\t signpost?\n";
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
