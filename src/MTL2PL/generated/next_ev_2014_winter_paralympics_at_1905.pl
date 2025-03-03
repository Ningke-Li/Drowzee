:- include('database.pl').
ev_2014_winter_paralympics(Start,End) :- begin('ev_2014_winter_paralympics',_,_,Start), end('ev_2014_winter_paralympics',_,_,End), Start=<End.

next_ev_2014_winter_paralympics(Start,End) :- ev_2014_winter_paralympics(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2014_winter_paralympics_at_1905(Res) :- setof((Start,End),next_ev_2014_winter_paralympics(Start,End),AllINtervals), checkvalidity(1905,AllINtervals,Res).

check_query() :- write('Query = next_ev_2014_winter_paralympics_at_1905'), (next_ev_2014_winter_paralympics_at_1905(true) -> write('\nRes   = true');write('\nRes   = false')).

