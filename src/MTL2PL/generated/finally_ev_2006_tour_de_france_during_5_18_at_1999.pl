:- include('database.pl').
ev_2006_tour_de_france(Start,End) :- begin('ev_2006_tour_de_france',_,_,Start), end('ev_2006_tour_de_france',_,_,End), Start=<End.

finally_ev_2006_tour_de_france_during_5_18(Start,End) :- ev_2006_tour_de_france(Start1,End1), (Start1-18)=<(End1-5), Start is (Start1-18), End is (End1-5), Start=<End.

finally_ev_2006_tour_de_france_during_5_18_at_1999(Res) :- setof((Start,End),finally_ev_2006_tour_de_france_during_5_18(Start,End),AllINtervals), checkvalidity(1999,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2006_tour_de_france_during_5_18_at_1999'), (finally_ev_2006_tour_de_france_during_5_18_at_1999(true) -> write('\nRes   = true');write('\nRes   = false')).

