use strict;
use warnings;

#help module needed to run castle.pl

sub help {
    print "\nHELP\n\n";
    print "Some useful commands; search, look, jump, hide...\n";
    print "Type the name of an item in the room to look more\n closely at it or interact with it\n";
    print "Type items to get a list of all visible items in a\n room\n";
    print "Use 'y' and 'n' to answer questions\n";
    print "Type 'i' for inventory\n";
    print "Type 's' or 'stats' for your statistics\n";
    print "Type 'hint' for a clue\n";
    print "Type 'quit' if you want to exit the game\n";
    print "\n";
    command();
}

1;
