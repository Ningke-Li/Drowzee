:- include('database.pl').
ev_1903_tour_de_france(Start,End) :- begin('ev_1903_tour_de_france',_,_,Start), end('ev_1903_tour_de_france',_,_,End), Start=<End.

finally_ev_1903_tour_de_france_during_5_19(Start,End) :- ev_1903_tour_de_france(Start1,End1), (Start1-19)=<(End1-5), Start is (Start1-19), End is (End1-5), Start=<End.

finally_ev_1903_tour_de_france_during_5_19_at_1888(Res) :- setof((Start,End),finally_ev_1903_tour_de_france_during_5_19(Start,End),AllINtervals), checkvalidity(1888,AllINtervals,Res).

check_query() :- write('Query = finally_ev_1903_tour_de_france_during_5_19_at_1888'), (finally_ev_1903_tour_de_france_during_5_19_at_1888(true) -> write('\nRes   = true');write('\nRes   = false')).

