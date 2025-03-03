:- include('database.pl').
glee(Start,End) :- begin('glee',_,_,Start), end('glee',_,_,End), Start=<End.

stargate_universe(Start,End) :- begin('stargate_universe',_,_,Start), end('stargate_universe',_,_,End), Start=<End.

generate_facts_glee_AND_stargate_universe([]) :- assert(glee_AND_stargate_universe(-1,-1)).

generate_facts_glee_AND_stargate_universe([(Start,End) | Tail]) :- assert(glee_AND_stargate_universe(Start,End)), generate_facts_glee_AND_stargate_universe(Tail).

glee_AND_stargate_universe_aux() :- findall((Start,End),glee(Start,End),Interval1), findall((Start,End),stargate_universe(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_glee_AND_stargate_universe(Interval).

glee_AND_stargate_universe_at_1863(Res) :- setof((Start,End),glee_AND_stargate_universe(Start,End),AllINtervals), checkvalidity(1863,AllINtervals,Res).

check_query() :- write('Query = glee_AND_stargate_universe_at_1863'), (glee_AND_stargate_universe_at_1863(true) -> write('\nRes   = true');write('\nRes   = false')).
?- glee_AND_stargate_universe_aux().

