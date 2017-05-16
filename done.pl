#!/usr/bin/perl

#achievements file needed to run castle.pl

sub done {
    print "Your Achievements so far:\n\n";

    if ($done{"begin"} == 1) {
        print "You have started the game\n";
    }

#PART 1

    if ($done{"door"} == 1) {
        print "You have unlocked the tower door\t +1\n";
    }

    if ($done{"out"} == 1) {
        print "You have left the house\t +1\n"; #go to garden,  veranda, drive or secret tunnel - needs adding to hall, study, tower, entrance and library 
    }

    if ($done{"flight"} == 1) {
        print "You can fly... sort of\t +1\n"; #jump out tower window whilst wearing cloak
    }

    if ($done{"password"} == 1) {
        print "You have discovered the secret password\t +2\n"; #look at the steamed up mirror
    }

    if ($done{"monster"} == 1) {
        print "You have slain the monster\t +5\n";
    }

    if ($done{"ship_fixed"} == 1) {
        print "You have mended the spaceship\t +3\n";
    }

    if ($done{"blastoff"} == 1) {
        print "You have left earth behind\t +2\n";
    }

#PART 2

    print "\n Total Score = $score\n\n";
    command();
}

1;
