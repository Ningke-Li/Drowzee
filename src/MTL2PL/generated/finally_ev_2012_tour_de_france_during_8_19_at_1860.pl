:- include('database.pl').
ev_2012_tour_de_france(Start,End) :- begin('ev_2012_tour_de_france',_,_,Start), end('ev_2012_tour_de_france',_,_,End), Start=<End.

finally_ev_2012_tour_de_france_during_8_19(Start,End) :- ev_2012_tour_de_france(Start1,End1), (Start1-19)=<(End1-8), Start is (Start1-19), End is (End1-8), Start=<End.

finally_ev_2012_tour_de_france_during_8_19_at_1860(Res) :- setof((Start,End),finally_ev_2012_tour_de_france_during_8_19(Start,End),AllINtervals), checkvalidity(1860,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2012_tour_de_france_during_8_19_at_1860'), (finally_ev_2012_tour_de_france_during_8_19_at_1860(true) -> write('\nRes   = true');write('\nRes   = false')).

