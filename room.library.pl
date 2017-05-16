#!/usr/bin/perl

#part of THE CASTLE text based game 

#This is the library
#items: fireplace, bookshelves
#stuff: book, book1, book2, book3
#starting conditions: study door is locked
#This room is attached to: hall, study

sub library_command {
	#print a prompt 
    print ">";
    $command = <STDIN>;
	#remove trailing \n
    chomp($command);
	#shift all upper case to lower 
    $command =~ tr/A-Z/a-z/;

#specific commands:

    if ($command eq "room"){
        print "You are in The Library\n";
        command();
    }

    if ($command eq "items"){
        print "The room contains a chair, a fireplace and bookshelves\n";
        print "There are two doors leading out of this room\n";
        command();
    } 

    if ($command eq "chair"){
	print "You walk carefully up to the chair and take a closer look\n";
	if ($inventory{"book"} == 1){
            print "The chair is empty\n";
	    command();
	}
	else {
            print "On the chair is a book titled 'The Beginner's Guide to Fighting Monsters'\n";
	    print "Do you want to take the book?\n";
            $answer = <STDIN>;
            chomp($answer);
            $answer =~ tr/A-Z/a-z/;
            if ($answer eq "y" || $answer eq "yes") {
		print "You take the book\n";
		$inventory{"book"} = 1;
		$load = $load + 0.7;
        	command();
	    }
	    else {
		print "You leave the book on the chair\n";
        	command();
	    }
	}
    }

    if (($command =~ "fire" || $command =~ "fireplace") && $command ne "light fire"){
        print "The hearth is cold and dusty\n";
        print "It doesn't look like anyone's been here recently\n";
        command();
    }

    if ($command eq "shelves" || $command eq "bookcases" || $command eq "bookcase"){
        print "You examine the bookcases\n";
        print "They're shelves covered in books\n";
        command();
    }

    elsif ($command eq "jump") {
	print "You jump up and down on the spot for a while...\n";
	sleep (1);
	print "That was pointless, what next?\n";
        $tired ++;
	command();
    }

    elsif ($command eq "light fire") {
	print "You have nothing to light fire with\n";
	command();
    }

    elsif ($command eq "take book") { #IMPROVE USE OF RAND IN THIS PART
	print "You take a book at random off the shelf\n";
        $book_id = rand(100);
        if ($book_id <=30){
            $book_name = "'Greenfingers: A Guide to Gardening'";
        }
        elsif ($book_id < 60){
           $book_name = "'XT177 Manual'";
        }
        else {
           $book_name = "'The Hexademogogonian'";
        }
        print "It's a copy of $book_name\n";
        sleep (1);
        print "Do you want to take it with you?\n";
	$answer = <STDIN>;
        chomp($answer);
        $answer =~ tr/A-Z/a-z/;
	if ($answer eq "y" || $answer eq "yes"){
             print "You add the book to your growing collection of stuff\n";
             if ($book_id <=30){
                 $inventory{"book1"} = 1;
             }
             elsif ($book_id < 60){
                 $inventory{"book2"} = 1;
             }
             else {
                 $inventory{"book3"} = 1;
             }
             $tired ++;
	     command();
	}
	else {
            print "'I'm not carrying that round with me!'\n";
	    command();
        }
    }

    elsif ($command =~ "search") {
	print "You search the room meticulously\n";
        $tired ++;
	sleep (1);
	print "You find a hidden door in one of the bookcases\n";
#Stuff to do with the hidden door and the password
	command();
    }

    if ($command =~ "door"){
        print "There are two doors leading out of this room\n";
        sleep (1);
        print "Door 1 leads back to the hall\n";
        print "Door 2 leads to another room\n";  #make this change if the hidden door has not been found 
        sleep (1);
        print "Which door do you want? (1/2)\n";
        $choose_door = <STDIN>;
        chomp($choose_door);
        if ($choose_door eq "1"){
            print "You go through into the hall\n";
            $room = "hall";
            command();
        }
        elsif ($choose_door eq "2"){
	    if ($inventory{"key5"} == 1){
		print "You unlock the door and go through to the study\n\n";
		$room = "study";
		print "The room is very dusty\n";
		print "There is a desk with a faux leather swivel chair\n";
		print "Above the desk is shelf\n";
		print "Behind the desk french doors lead out into the garden\n";
		command();
	    }
	    else {
                print "This door is locked\n";   
                command();
	    }
        } 
        else { 
            print "You pick neither door and stay in the library\n";
            command();
        }
    }

#RETURN!!!

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
	print "What do you want to look at?\n"; #ADD LIST OF ITEMS
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
