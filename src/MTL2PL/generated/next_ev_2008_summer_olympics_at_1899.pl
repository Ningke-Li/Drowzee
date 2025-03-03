:- include('database.pl').
ev_2008_summer_olympics(Start,End) :- begin('ev_2008_summer_olympics',_,_,Start), end('ev_2008_summer_olympics',_,_,End), Start=<End.

next_ev_2008_summer_olympics(Start,End) :- ev_2008_summer_olympics(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2008_summer_olympics_at_1899(Res) :- setof((Start,End),next_ev_2008_summer_olympics(Start,End),AllINtervals), checkvalidity(1899,AllINtervals,Res).

check_query() :- write('Query = next_ev_2008_summer_olympics_at_1899'), (next_ev_2008_summer_olympics_at_1899(true) -> write('\nRes   = true');write('\nRes   = false')).

