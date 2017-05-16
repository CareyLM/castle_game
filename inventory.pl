#!/usr/bin/perl

#inventory file needed to run castle.pl

sub inventory {
    print "You have:\n";
#start
    if ($inventory{"unease"} == 1) {
        print "a deep sense of unease\n";
    }

#body
    if ($inventory{"brokenf"} == 1) {
        print "a broken foot\n";
    }
    if ($inventory{"brokenh"} == 1) {
        print "a broken hand\n";
    }
    if ($inventory{"brokenl"} == 1) {
        print "a broken leg\n";
    }
    if ($inventory{"brokena"} == 1) {
        print "a broken arm\n";
    }

#tower    
    if ($inventory{"key1"} == 1) {
        print "a small key\n";	#for unlocking the chest 
    }
    if ($inventory{"key2"} == 1) {
        print "a large rusty key\n";	#for unlocking the tower door
    }
    if ($inventory{"knife"} == 1) {
        print "a knife\n";	#weapon
    }
#hall
    if ($inventory{"rock"} == 1) {
        print "your beloved pet rock\n"; #weapon
    }
#library
    if ($inventory{"book"} == 1) {
        print "a copy of 'The Beginner's Guide to Fighting Monsters'\n";
    }
    if ($inventory{"book1"} == 1) {
        print "a copy of 'Greenfingers: A Guide to Gardening'\n";
    }
    if ($inventory{"book2"} == 1) {
        print "a copy of 'XT177 Manual'\n";
    }
    if ($inventory{"book3"} == 1) {
        print "a copy of 'The Hexademogogonian'\n";
    }
#entrance
    if ($inventory{"boots"} == 1 && $bootsworn eq "yes") {
        print "a pair of old boots (being worn)\n";
    }
    if ($inventory{"boots"} == 1 && $bootsworn ne "yes") {
        print "a pair of old boots\n";
    }
    if ($inventory{"pipe"} == 1) {
        print "a length of copper pipe\n"; #weapon
    }
#study
    if ($inventory{"map"} == 1) {
        print "a mysterious map\n"; #not sure if to include
    }
#tunnel
    if ($inventory{"matches"} == 1) {
        print "a box of matches\n";
    }
#cave
    if ($inventory{"loot"} == 1) {
        print "a stit load of gold\n";
    }
#veranda
    if ($inventory{"plant"} == 1) {
        print "a swiss cheese plant\n";
    }
#woods
    if ($inventory{"stick"} == 1) {
        print "a stick\n";	#weapon
    }
#garden
    if ($inventory{"plantpot"} == 1) {
        print "a plantpot\n";
    }
    if ($inventory{"flower"} == 1) {
        print "a beautiful flower\n";
    }
#moregarden
    if ($inventory{"spade"} == 1) {
        print "a spade\n";	#weapon
    }
    if ($inventory{"gloves"} == 1 && $glovesworn eq "yes") {
        print "a pair of gardening gloves (being worn)\n";
    }
    if ($inventory{"gloves"} == 1 && $glovesworn ne "yes") {
        print "a pair of gardening gloves\n";
    }
#drive
    if ($inventory{"key3"} == 1) {
        print "a silver key\n";
    }
#upstairs
    if ($inventory{"key4"} == 1) {
        print "a bunch of keys\n";
    }
    if ($inventory{"picture"} == 1) {
        print "a picture of a clown riding a T-rex\n";
    }
#bathroom
    if ($inventory{"soap"} == 1) {
        print "a piece of soap\n";
    }
    if ($inventory{"towel"} == 1) {
        print "a towel\n";
    }
#bedroom
    if ($inventory{"cloak"} == 1 && $cloakworn eq "yes") {
        print "a cloak (being worn)\n";
    }
    if ($inventory{"cloak"} == 1 && $cloakworn ne "yes") {
        print "a cloak\n";
    }
    if ($inventory{"hat"} == 1 && $hatworn eq "yes") {
        print "a very silly hat (being worn)\n";
    }
    if ($inventory{"hat"} == 1 && $hatworn ne "yes") {
        print "a very silly hat\n";
    }
    if ($inventory{"pillow"} == 1) {
        print "a fluffy pillow\n";
    }
    if ($inventory{"key5"} == 1) {
        print "a gold key\n";
    }
#hanger
    if ($inventory{"goggles"} == 1 && $gogglesworn eq "yes") {
        print "a pair of goggles (being worn)\n";
    }
    if ($inventory{"gloves"} == 1 && $gogglesworn ne "yes") {
        print "a pair of goggles\n";
    }

#spaceship
    print "\n";
    command();
}

1;
