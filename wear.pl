#!/usr/bin/perl

#wear file needed to run castle.pl
#runs if a command includes 'wear' or 'put on'

#hat
sub wear {
    if ($command =~ "hat"){
        if ($hatworn = "no"){
	    if ($inventory{"hat"} == 1){
	        $hatworn = "yes";
		$health ++;
	        print "You put on the silly hat\n";
	    }
	    else {
	        print "You don't have a hat\n";
	    }
	}
	else {
	print "You are already wearing the silly hat\n";
	}
    }

#cloak
    if ($command =~ "cloak"){
        if ($cloakworn = "no"){
	    if ($inventory{"cloak"} == 1){
	        $cloakworn = "yes";
		$health = $health + 2;
	        print "You put on the cloak\n";
	    }
	    else {
	        print "You don't have a cloak\n";
	    }
	}
	else {
	print "You are already wearing the cloak\n";
	}
    }

#gloves
    if ($command =~ "gloves"){
        if ($glovesworn = "no"){
	    if ($inventory{"gloves"} == 1){
	        $glovesworn = "yes";
		$health ++;
	        print "You put on the gardening gloves\n";
	    }
	    else {
	        print "You don't have any gloves\n";
	    }
	}
	else {
	print "You are already wearing the gloves\n";
	}
    }

#goggles
    if ($command =~ "goggles"){
        if ($gogglesworn = "no"){
	    if ($inventory{"goggles"} == 1){
	        $gogglesworn = "yes";
		$health ++;
	        print "You put on the goggles\n";
	    }
	    else {
	        print "You don't have any goggles\n";
	    }
	}
	else {
	print "You are already wearing the goggles\n";
	}
    }

    else {
	print "I don't understand that command\n";    
    }
    command();
}

1;
