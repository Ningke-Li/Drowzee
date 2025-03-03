:- include('database.pl').
jackie_chan_adventures(Start,End) :- begin('jackie_chan_adventures',_,_,Start), end('jackie_chan_adventures',_,_,End), Start=<End.

teenage_mutant_ninja_turtles(Start,End) :- begin('teenage_mutant_ninja_turtles',_,_,Start), end('teenage_mutant_ninja_turtles',_,_,End), Start=<End.

jackie_chan_adventures_last_till_1_7(Start,End) :- jackie_chan_adventures(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

jackie_chan_adventures_until_teenage_mutant_ninja_turtles_during_1_7_overlap(Start,End) :- jackie_chan_adventures_last_till_1_7(Start1,End1), teenage_mutant_ninja_turtles(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

jackie_chan_adventures_until_teenage_mutant_ninja_turtles_during_1_7(Start,End) :- jackie_chan_adventures(W1,_), jackie_chan_adventures_until_teenage_mutant_ninja_turtles_during_1_7_overlap(Start1,End1), Start is max((Start1-7),W1), End is (End1-1), Start=<End.

jackie_chan_adventures_until_teenage_mutant_ninja_turtles_during_1_7_at_2006(Res) :- setof((Start,End),jackie_chan_adventures_until_teenage_mutant_ninja_turtles_during_1_7(Start,End),AllINtervals), checkvalidity(2006,AllINtervals,Res).

check_query() :- write('Query = jackie_chan_adventures_until_teenage_mutant_ninja_turtles_during_1_7_at_2006'), (jackie_chan_adventures_until_teenage_mutant_ninja_turtles_during_1_7_at_2006(true) -> write('\nRes   = true');write('\nRes   = false')).

