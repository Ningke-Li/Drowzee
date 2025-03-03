:- include('database.pl').
ev_2006_tour_de_france(Start,End) :- begin('ev_2006_tour_de_france',_,_,Start), end('ev_2006_tour_de_france',_,_,End), Start=<End.

finally_ev_2006_tour_de_france_during_1_14(Start,End) :- ev_2006_tour_de_france(Start1,End1), (Start1-14)=<(End1-1), Start is (Start1-14), End is (End1-1), Start=<End.

finally_ev_2006_tour_de_france_during_1_14_at_1994(Res) :- setof((Start,End),finally_ev_2006_tour_de_france_during_1_14(Start,End),AllINtervals), checkvalidity(1994,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2006_tour_de_france_during_1_14_at_1994'), (finally_ev_2006_tour_de_france_during_1_14_at_1994(true) -> write('\nRes   = true');write('\nRes   = false')).

