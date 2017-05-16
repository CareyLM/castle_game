#!/usr/bin/perl

#use warnings;

#castle.pl
#A text based adventure game written in perl 
#first created 17/01/17 

sub help;
sub command;
sub inventory;
sub stats;
sub done;
sub wear;
#PART 1
sub tower_command;
sub hall_command;
sub library_command;
sub entrance_command;
sub upstairs_command;
sub bedroom_command;
sub drive_command;
sub woods_command;
sub cave_command;
sub tunnel_command;
sub garden_command;
sub moregarden_command;
sub veranda_command;
sub study_command;
sub hanger_command;
sub spaceship_command;
sub monster_command;

#other files required to run:
require "inventory.pl";
require "stats.pl";
require "done.pl";
require "help.pl";
require "wear.pl";
require "room.tower.pl";
require "room.hall.pl";
require "room.library.pl";
require "room.entrance.pl";
require "room.upstairs.pl";
require "room.bedroom.pl";
require "room.bathroom.pl";
require "room.drive.pl";
require "room.woods.pl";
require "room.cave.pl";
require "room.tunnel.pl";
require "room.garden.pl";
require "room.more_garden.pl";
require "room.veranda.pl";
require "room.study.pl";
require "room.hanger.pl";
require "room.spaceship.pl";
require "event.monster.pl";

system("cls");

#Into information
print "Welcome to THE CASTLE: A text based adventure game\n";
print "Type 'help' at any time for command help and 'quit' to quit.\n";
sleep (1);
print "Let's begin...\n";
sleep (1);
print "You are alone in a small room\n";
sleep (1);
print "The only furniture is a bed, a small table and a chest\n";
sleep (1);
print "There is a window and a door\n";
sleep (1);
print "What do you want to do?\n";

#scores and starting values
$score = 0;
$tired = 0;
$load = 0;	#weight of inventory 
$health = 20;
$coin = 0;	#not yet in use 

#KEY START CONDITIONS
%inventory = ("unease" => 1);
%done = ("begin" => 1);
$room = "start";

#starting conditions
$you = "alive"; # you are alive 
$steam = "no"; # no steam in the bathroom
$shower = "off"; #the shower is off
$cave = "dark"; #the cave is dark 
$monster = "alive"; #the monster is alive
$monsterhealth = 30; 
$cover = "on"; # the spaceship is covered by a sheet
$spaceship = "broken"; # the spaceship is broken

if ($health < 1){
    $you = "dead";
} 

if ($monsterhealth < 1){
    $monster = "dead";
} 

#doors
$door_lock = "locked";
$secret_door_lock = "locked";
$hanger_door_lock = "locked";
$veranda_door_lock = "locked";
#doors are locked at start of game

#clothing
$cloakworn = "no";
$hatworn = "no";
$bootsworn = "no";
$glovesworn = "no";
$gogglesworn = "no"; 

#BEGIN GAME
command();

sub command {
#specify what subroutine to run
#PART 1 
    if ($room eq "start" || $room eq "tower") { tower_command(); }
    if ($room eq "hall") { hall_command(); }
    if ($room eq "library") { library_command(); }
    if ($room eq "entrance"){ entrance_command(); }
    if ($room eq "upstairs"){ upstairs_command(); }
    if ($room eq "bedroom"){ bedroom_command(); }
    if ($room eq "bathroom"){ bathroom_command(); }
    if ($room eq "drive"){ drive_command(); }
    if ($room eq "woods"){ woods_command(); }
    if ($room eq "cave"){ cave_command(); }
    if ($room eq "tunnel"){ tunnel_command(); }
    if ($room eq "garden"){ garden_command(); }
    if ($room eq "more_garden"){ moregarden_command(); }
    if ($room eq "veranda"){ veranda_command(); }
    if ($room eq "study"){ study_command(); }
    if ($room eq "hanger"){ hanger_command(); }
    if ($room eq "spaceship"){ spaceship_command(); }
    if ($room eq "monster"){ monster_command(); }
}
