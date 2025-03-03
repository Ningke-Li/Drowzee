:- include('database.pl').
ev_2007_08_uefa_cup(Start,End) :- begin('ev_2007_08_uefa_cup',_,_,Start), end('ev_2007_08_uefa_cup',_,_,End), Start=<End.

next_ev_2007_08_uefa_cup(Start,End) :- ev_2007_08_uefa_cup(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2007_08_uefa_cup_at_1856(Res) :- setof((Start,End),next_ev_2007_08_uefa_cup(Start,End),AllINtervals), checkvalidity(1856,AllINtervals,Res).

check_query() :- write('Query = next_ev_2007_08_uefa_cup_at_1856'), (next_ev_2007_08_uefa_cup_at_1856(true) -> write('\nRes   = true');write('\nRes   = false')).

