:- include('database.pl').
stargate_universe(Start,End) :- begin('stargate_universe',_,_,Start), end('stargate_universe',_,_,End), Start=<End.

vostok_programme(Start,End) :- begin('vostok_programme',_,_,Start), end('vostok_programme',_,_,End), Start=<End.

generate_facts_stargate_universe_AND_vostok_programme([]) :- assert(stargate_universe_AND_vostok_programme(-1,-1)).

generate_facts_stargate_universe_AND_vostok_programme([(Start,End) | Tail]) :- assert(stargate_universe_AND_vostok_programme(Start,End)), generate_facts_stargate_universe_AND_vostok_programme(Tail).

stargate_universe_AND_vostok_programme_aux() :- findall((Start,End),stargate_universe(Start,End),Interval1), findall((Start,End),vostok_programme(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_stargate_universe_AND_vostok_programme(Interval).

stargate_universe_AND_vostok_programme_at_1890(Res) :- setof((Start,End),stargate_universe_AND_vostok_programme(Start,End),AllINtervals), checkvalidity(1890,AllINtervals,Res).

check_query() :- write('Query = stargate_universe_AND_vostok_programme_at_1890'), (stargate_universe_AND_vostok_programme_at_1890(true) -> write('\nRes   = true');write('\nRes   = false')).
?- stargate_universe_AND_vostok_programme_aux().

