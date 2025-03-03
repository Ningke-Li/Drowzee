:- include('database.pl').
skins(Start,End) :- begin('skins',_,_,Start), end('skins',_,_,End), Start=<End.

teenage_mutant_ninja_turtles(Start,End) :- begin('teenage_mutant_ninja_turtles',_,_,Start), end('teenage_mutant_ninja_turtles',_,_,End), Start=<End.

skins_last_till_1_6(Start,End) :- skins(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

skins_until_teenage_mutant_ninja_turtles_during_1_6_overlap(Start,End) :- skins_last_till_1_6(Start1,End1), teenage_mutant_ninja_turtles(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

skins_until_teenage_mutant_ninja_turtles_during_1_6(Start,End) :- skins(W1,_), skins_until_teenage_mutant_ninja_turtles_during_1_6_overlap(Start1,End1), Start is max((Start1-6),W1), End is (End1-1), Start=<End.

skins_until_teenage_mutant_ninja_turtles_during_1_6_at_44(Res) :- setof((Start,End),skins_until_teenage_mutant_ninja_turtles_during_1_6(Start,End),AllINtervals), checkvalidity(44,AllINtervals,Res).

check_query() :- write('Query = skins_until_teenage_mutant_ninja_turtles_during_1_6_at_44'), (skins_until_teenage_mutant_ninja_turtles_during_1_6_at_44(true) -> write('\nRes   = true');write('\nRes   = false')).

