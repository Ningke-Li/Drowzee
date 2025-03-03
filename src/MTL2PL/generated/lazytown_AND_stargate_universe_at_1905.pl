:- include('database.pl').
lazytown(Start,End) :- begin('lazytown',_,_,Start), end('lazytown',_,_,End), Start=<End.

stargate_universe(Start,End) :- begin('stargate_universe',_,_,Start), end('stargate_universe',_,_,End), Start=<End.

generate_facts_lazytown_AND_stargate_universe([]) :- assert(lazytown_AND_stargate_universe(-1,-1)).

generate_facts_lazytown_AND_stargate_universe([(Start,End) | Tail]) :- assert(lazytown_AND_stargate_universe(Start,End)), generate_facts_lazytown_AND_stargate_universe(Tail).

lazytown_AND_stargate_universe_aux() :- findall((Start,End),lazytown(Start,End),Interval1), findall((Start,End),stargate_universe(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_lazytown_AND_stargate_universe(Interval).

lazytown_AND_stargate_universe_at_1905(Res) :- setof((Start,End),lazytown_AND_stargate_universe(Start,End),AllINtervals), checkvalidity(1905,AllINtervals,Res).

check_query() :- write('Query = lazytown_AND_stargate_universe_at_1905'), (lazytown_AND_stargate_universe_at_1905(true) -> write('\nRes   = true');write('\nRes   = false')).
?- lazytown_AND_stargate_universe_aux().

