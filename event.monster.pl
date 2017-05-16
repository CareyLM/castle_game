#!/usr/bin/perl
#use warnings;

#part of THE CASTLE text based game 

#This should run if the monster is still alive

sub monster_command {
    print ">";
    $command = <STDIN>;
    chomp($command); 
    $command =~ tr/A-Z/a-z/;

if ($health < 1){
    $you = "dead";
} 

if ($monsterhealth < 1){ # combine this with the clauses below
    $monster = "dead";
} 

    if ($you eq "dead"){
	print "You are dead\n";
	sleep (1);
	print "GAME OVER\n";
	sleep (3);
	exit;	
    }

    if ($monster eq "dead"){
	print "The monster is dead\n";
	$room = "cave";
	command();
    }

#other commands

#kick
#hit/punch
#run

#weapons

    elsif($command =~ "knife") {
	if ($inventory{"knife"} == 1){
	    print "You attack the monster using your knife\n";
	    sleep (1);
  	    $damage = int(rand(4...8));
	    $monsterhealth = $monsterhealth - $damage;
	    print "You deal $damage damage\n";
	    sleep (1);
	    command();	    	    
	}
	else{
	    print "You don't have a knife\n";
	}
	print "The monster attacks...\n";
	$damage = int(rand(6));
	$health = $health - $damage;
        sleep (1);
	print "It deals $damage damage\n";
        sleep (1);
	command();	
    }

    elsif($command =~ "rock") {
	if ($inventory{"rock"} == 1){
	    print "You throw your dear pet rock at the monster\n";
	    sleep (1);
  	    $damage = int(rand(1...4));
	    $monsterhealth = $monsterhealth - $damage;
	    $inventory{"rock"} = 0;
	    print "You deal $damage damage\n";
	    sleep (1);
	    command();	    	    
	}
	else{
	    print "You don't have a rock\n";
	}
	print "The monster attacks...\n";
	$damage = int(rand(6));
	$health = $health - $damage;
        sleep (1);
	print "It deals $damage damage\n";
        sleep (1);
	command();	
    }

    elsif($command =~ "pipe") {
	if ($inventory{"pipe"} == 1){
	    print "You whack the monster with the length of piping\n";
	    sleep (1);
  	    $damage = int(rand(4...6));
	    $monsterhealth = $monsterhealth - $damage;
	    print "You deal $damage damage\n";
	    sleep (1);
	    command();	    	    
	}
	else{
	    print "You don't have a pipe\n";
	}
	print "The monster attacks...\n";
	$damage = int(rand(6));
	$health = $health - $damage;
        sleep (1);
	print "It deals $damage damage\n";
        sleep (1);
	command();	
    }

    elsif($command =~ "stick") {
	if ($inventory{"pipe"} == 1){
	    print "You hut the monster with your stick\n";
	    sleep (1);
  	    $damage = int(rand(2...3));
	    $monsterhealth = $monsterhealth - $damage;
	    print "You deal $damage damage\n";
	    sleep (1);
	    command();	    	    
	}
	else{
	    print "You don't have a stick\n";
	}
	print "The monster attacks...\n";
	$damage = int(rand(6));
	$health = $health - $damage;
        sleep (1);
	print "It deals $damage damage\n";
        sleep (1);
	command();	
    }

    elsif($command =~ "spade") {
	if ($inventory{"spade"} == 1){
	    print "You attack the monster using your spade\n";
	    sleep (1);
  	    $damage = int(rand(6...9));
	    $monsterhealth = $monsterhealth - $damage;
	    print "You deal $damage damage\n";
	    sleep (1);
	    command();	    	    
	}
	else{
	    print "You don't have a spade\n";
	}
	print "The monster attacks...\n";
	$damage = int(rand(6));
	$health = $health - $damage;
        sleep (1);
	print "It deals $damage damage\n";
        sleep (1);
	command();	
    }

#not weapons 

    elsif($command =~ "key" || $command =~ "keys") {
	if ($inventory{"key1"} | {"key2"} | {"key3"} | {"key4"} | {"key5"} == 1){
	    print "You attack the monster using your keys\n";
	    sleep (1);
	    print "It doesn't really do much\n";
	    sleep (1);
  	    $damage = 1;
	    $monsterhealth = $monsterhealth - $damage;
	    print "You deal $damage damage\n";
	    sleep (1);
	    command();	    	    
	}
	else{
	    print "You don't have any keys\n";
	}
	print "The monster attacks...\n";
	$damage = int(rand(6));
	$health = $health - $damage;
        sleep (1);
	print "It deals $damage damage\n";
        sleep (1);
	command();	
    }

    elsif($command =~ "book") {
	if ($inventory{"book"} | {"book1"} | {"book2"} | {"book3"} == 1){
	    print "You attack the monster using a book\n";
	    sleep (1);
	    print "It doesn't really do much...\n";
	    sleep (1);
	    print "...except dent your book\n";
	    sleep (1);
  	    $damage = 1;
	    $monsterhealth = $monsterhealth - $damage;
	    print "You deal $damage damage\n";
	    sleep (1);
	    command();	    	    
	}
	else{
	    print "You don't have any books\n";
	}
	print "The monster attacks...\n";
	$damage = int(rand(6));
	$health = $health - $damage;
        sleep (1);
	print "It deals $damage damage\n";
        sleep (1);
	command();	
    }

    elsif($command =~ "plant") {
	if ($inventory{"plant"} == 1){
	    print "You attack the monster using the swiss cheese plant\n";
	    sleep (1);
	    print "........\n";
	    sleep (1);
  	    $damage = 3;
	    $monsterhealth = $monsterhealth - $damage;
	    $inventory{"plant"} = 0;
	    print "You deal $damage damage\n";
	    sleep (1);
	    command();	    	    
	}
	else{
	    print "You don't have a plant\n";
	}
	print "The monster attacks...\n";
	$damage = int(rand(6));
	$health = $health - $damage;
        sleep (1);
	print "It deals $damage damage\n";
        sleep (1);
	command();	
    }

    elsif($command =~ "pillow") {
	if ($inventory{"key1"} == 1){
	    print "You attack the monster using the pillow\n";
	    sleep (1);
	    print "Feathers fly everywhere\n";
	    sleep (1);
  	    $damage = 0;
	    $monsterhealth = $monsterhealth - $damage;
	    print "You deal $damage damage\n";
	    sleep (1);
	    command();	    	    
	}
	else{
	    print "You don't have a pillow\n";
	}
	print "The monster attacks...\n";
	$damage = int(rand(6));
	$health = $health - $damage;
        sleep (1);
	print "It deals $damage damage\n";
        sleep (1);
	command();	
    }

    elsif($command =~ "pillow") {
	if ($inventory{"key1"} == 1){
	    print "You attack the monster using the pillow\n";
	    sleep (1);
	    print "Feathers fly everywhere\n";
	    sleep (1);
  	    $damage = 0;
	    $monsterhealth = $monsterhealth - $damage;
	    print "You deal $damage damage\n";
	    sleep (1);
	    command();	    	    
	}
	else{
	    print "You don't have a pillow\n";
	}
	print "The monster attacks...\n";
	$damage = int(rand(6));
	$health = $health - $damage;
        sleep (1);
	print "It deals $damage damage\n";
        sleep (1);
	command();	
    }

    elsif($command =~ "pillow") {
	if ($inventory{"key1"} == 1){
	    print "You attack the monster using the pillow\n";
	    sleep (1);
	    print "Feathers fly everywhere\n";
	    sleep (1);
  	    $damage = 0;
	    $monsterhealth = $monsterhealth - $damage;
	    print "You deal $damage damage\n";
	    sleep (1);
	    command();	    	    
	}
	else{
	    print "You don't have a pillow\n";
	}
	print "The monster attacks...\n";
	$damage = int(rand(6));
	$health = $health - $damage;
        sleep (1);
	print "It deals $damage damage\n";
        sleep (1);
	command();	
    }

#attacking with clothing items

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
    elsif ($command =~ "a") {
        inventory();
    }

	#wear
    elsif ($command =~ "wear" | "put on"){
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

    else {  #GIVE THE MONSTER A TURN 
	print "I don't understand that command\n";
	print "The monster attacks...\n";
	$damage = int(rand(3));
	$health = $health - $damage;
        sleep (1);
	print "It deals $damage damage\n";
        sleep (1);
	command();
    }	
}

1;
