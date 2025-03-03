:- include('database.pl').
ev_1903_tour_de_france(Start,End) :- begin('ev_1903_tour_de_france',_,_,Start), end('ev_1903_tour_de_france',_,_,End), Start=<End.

next_ev_1903_tour_de_france(Start,End) :- ev_1903_tour_de_france(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_1903_tour_de_france_at_1902(Res) :- setof((Start,End),next_ev_1903_tour_de_france(Start,End),AllINtervals), checkvalidity(1902,AllINtervals,Res).

check_query() :- write('Query = next_ev_1903_tour_de_france_at_1902'), (next_ev_1903_tour_de_france_at_1902(true) -> write('\nRes   = true');write('\nRes   = false')).

