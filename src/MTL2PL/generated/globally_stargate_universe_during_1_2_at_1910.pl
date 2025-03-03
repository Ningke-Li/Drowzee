:- include('database.pl').
stargate_universe(Start,End) :- begin('stargate_universe',_,_,Start), end('stargate_universe',_,_,End), Start=<End.

globally_stargate_universe_during_1_2(Start,End) :- stargate_universe(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_stargate_universe_during_1_2_at_1910(Res) :- setof((Start,End),globally_stargate_universe_during_1_2(Start,End),AllINtervals), checkvalidity(1910,AllINtervals,Res).

check_query() :- write('Query = globally_stargate_universe_during_1_2_at_1910'), (globally_stargate_universe_during_1_2_at_1910(true) -> write('\nRes   = true');write('\nRes   = false')).

