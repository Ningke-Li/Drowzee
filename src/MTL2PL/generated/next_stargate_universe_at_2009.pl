:- include('database.pl').
stargate_universe(Start,End) :- begin('stargate_universe',_,_,Start), end('stargate_universe',_,_,End), Start=<End.

next_stargate_universe(Start,End) :- stargate_universe(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_stargate_universe_at_2009(Res) :- setof((Start,End),next_stargate_universe(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = next_stargate_universe_at_2009'), (next_stargate_universe_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).

