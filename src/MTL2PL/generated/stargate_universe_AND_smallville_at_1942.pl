:- include('database.pl').
stargate_universe(Start,End) :- begin('stargate_universe',_,_,Start), end('stargate_universe',_,_,End), Start=<End.

smallville(Start,End) :- begin('smallville',_,_,Start), end('smallville',_,_,End), Start=<End.

generate_facts_stargate_universe_AND_smallville([]) :- assert(stargate_universe_AND_smallville(-1,-1)).

generate_facts_stargate_universe_AND_smallville([(Start,End) | Tail]) :- assert(stargate_universe_AND_smallville(Start,End)), generate_facts_stargate_universe_AND_smallville(Tail).

stargate_universe_AND_smallville_aux() :- findall((Start,End),stargate_universe(Start,End),Interval1), findall((Start,End),smallville(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_stargate_universe_AND_smallville(Interval).

stargate_universe_AND_smallville_at_1942(Res) :- setof((Start,End),stargate_universe_AND_smallville(Start,End),AllINtervals), checkvalidity(1942,AllINtervals,Res).

check_query() :- write('Query = stargate_universe_AND_smallville_at_1942'), (stargate_universe_AND_smallville_at_1942(true) -> write('\nRes   = true');write('\nRes   = false')).
?- stargate_universe_AND_smallville_aux().

