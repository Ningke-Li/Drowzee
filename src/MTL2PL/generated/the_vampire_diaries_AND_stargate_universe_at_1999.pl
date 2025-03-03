:- include('database.pl').
the_vampire_diaries(Start,End) :- begin('the_vampire_diaries',_,_,Start), end('the_vampire_diaries',_,_,End), Start=<End.

stargate_universe(Start,End) :- begin('stargate_universe',_,_,Start), end('stargate_universe',_,_,End), Start=<End.

generate_facts_the_vampire_diaries_AND_stargate_universe([]) :- assert(the_vampire_diaries_AND_stargate_universe(-1,-1)).

generate_facts_the_vampire_diaries_AND_stargate_universe([(Start,End) | Tail]) :- assert(the_vampire_diaries_AND_stargate_universe(Start,End)), generate_facts_the_vampire_diaries_AND_stargate_universe(Tail).

the_vampire_diaries_AND_stargate_universe_aux() :- findall((Start,End),the_vampire_diaries(Start,End),Interval1), findall((Start,End),stargate_universe(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_vampire_diaries_AND_stargate_universe(Interval).

the_vampire_diaries_AND_stargate_universe_at_1999(Res) :- setof((Start,End),the_vampire_diaries_AND_stargate_universe(Start,End),AllINtervals), checkvalidity(1999,AllINtervals,Res).

check_query() :- write('Query = the_vampire_diaries_AND_stargate_universe_at_1999'), (the_vampire_diaries_AND_stargate_universe_at_1999(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_vampire_diaries_AND_stargate_universe_aux().

