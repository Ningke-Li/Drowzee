:- include('database.pl').
ev_2013_tour_de_france(Start,End) :- begin('ev_2013_tour_de_france',_,_,Start), end('ev_2013_tour_de_france',_,_,End), Start=<End.

finally_ev_2013_tour_de_france_during_8_18(Start,End) :- ev_2013_tour_de_france(Start1,End1), (Start1-18)=<(End1-8), Start is (Start1-18), End is (End1-8), Start=<End.

finally_ev_2013_tour_de_france_during_8_18_at_1864(Res) :- setof((Start,End),finally_ev_2013_tour_de_france_during_8_18(Start,End),AllINtervals), checkvalidity(1864,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2013_tour_de_france_during_8_18_at_1864'), (finally_ev_2013_tour_de_france_during_8_18_at_1864(true) -> write('\nRes   = true');write('\nRes   = false')).

