:- include('database.pl').
ev_2009_tour_de_france(Start,End) :- begin('ev_2009_tour_de_france',_,_,Start), end('ev_2009_tour_de_france',_,_,End), Start=<End.

next_ev_2009_tour_de_france(Start,End) :- ev_2009_tour_de_france(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2009_tour_de_france_at_2008(Res) :- setof((Start,End),next_ev_2009_tour_de_france(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = next_ev_2009_tour_de_france_at_2008'), (next_ev_2009_tour_de_france_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).

