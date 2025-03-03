:- include('database.pl').
ev_2007_08_uefa_cup(Start,End) :- begin('ev_2007_08_uefa_cup',_,_,Start), end('ev_2007_08_uefa_cup',_,_,End), Start=<End.

finally_ev_2007_08_uefa_cup_during_6_17(Start,End) :- ev_2007_08_uefa_cup(Start1,End1), (Start1-17)=<(End1-6), Start is (Start1-17), End is (End1-6), Start=<End.

finally_ev_2007_08_uefa_cup_during_6_17_at_1994(Res) :- setof((Start,End),finally_ev_2007_08_uefa_cup_during_6_17(Start,End),AllINtervals), checkvalidity(1994,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2007_08_uefa_cup_during_6_17_at_1994'), (finally_ev_2007_08_uefa_cup_during_6_17_at_1994(true) -> write('\nRes   = true');write('\nRes   = false')).

