:- include('database.pl').
ev_90210(Start,End) :- begin('ev_90210',_,_,Start), end('ev_90210',_,_,End), Start=<End.

teenage_mutant_ninja_turtles(Start,End) :- begin('teenage_mutant_ninja_turtles',_,_,Start), end('teenage_mutant_ninja_turtles',_,_,End), Start=<End.

ev_90210_last_till_1_8(Start,End) :- ev_90210(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

ev_90210_until_teenage_mutant_ninja_turtles_during_1_8_overlap(Start,End) :- ev_90210_last_till_1_8(Start1,End1), teenage_mutant_ninja_turtles(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

ev_90210_until_teenage_mutant_ninja_turtles_during_1_8(Start,End) :- ev_90210(W1,_), ev_90210_until_teenage_mutant_ninja_turtles_during_1_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-1), Start=<End.

ev_90210_until_teenage_mutant_ninja_turtles_during_1_8_at_13(Res) :- setof((Start,End),ev_90210_until_teenage_mutant_ninja_turtles_during_1_8(Start,End),AllINtervals), checkvalidity(13,AllINtervals,Res).

check_query() :- write('Query = ev_90210_until_teenage_mutant_ninja_turtles_during_1_8_at_13'), (ev_90210_until_teenage_mutant_ninja_turtles_during_1_8_at_13(true) -> write('\nRes   = true');write('\nRes   = false')).

