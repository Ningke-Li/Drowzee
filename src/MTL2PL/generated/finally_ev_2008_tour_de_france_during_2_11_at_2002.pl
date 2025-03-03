:- include('database.pl').
ev_2008_tour_de_france(Start,End) :- begin('ev_2008_tour_de_france',_,_,Start), end('ev_2008_tour_de_france',_,_,End), Start=<End.

finally_ev_2008_tour_de_france_during_2_11(Start,End) :- ev_2008_tour_de_france(Start1,End1), (Start1-11)=<(End1-2), Start is (Start1-11), End is (End1-2), Start=<End.

finally_ev_2008_tour_de_france_during_2_11_at_2002(Res) :- setof((Start,End),finally_ev_2008_tour_de_france_during_2_11(Start,End),AllINtervals), checkvalidity(2002,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2008_tour_de_france_during_2_11_at_2002'), (finally_ev_2008_tour_de_france_during_2_11_at_2002(true) -> write('\nRes   = true');write('\nRes   = false')).

