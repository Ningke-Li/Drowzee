:- include('database.pl').
ev_2006_winter_olympics(Start,End) :- begin('ev_2006_winter_olympics',_,_,Start), end('ev_2006_winter_olympics',_,_,End), Start=<End.

next_ev_2006_winter_olympics(Start,End) :- ev_2006_winter_olympics(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2006_winter_olympics_at_2005(Res) :- setof((Start,End),next_ev_2006_winter_olympics(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = next_ev_2006_winter_olympics_at_2005'), (next_ev_2006_winter_olympics_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).

