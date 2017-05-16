#!/usr/bin/perl

#statistics file needed to run castle.pl

sub stats {
    print "Your statistics are:\n\n";
    print "Health \t\t $health\n";
    print "Weariness \t $tired\n";
    print "Score \t\t $score\n\n";
    print "Your inventory weighs $load kg\n";
    print "\n";
    command();
}

1;
