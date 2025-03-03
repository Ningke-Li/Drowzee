:- include('database.pl').
kim_possible(Start,End) :- begin('kim_possible',_,_,Start), end('kim_possible',_,_,End), Start=<End.

stargate_atlantis(Start,End) :- begin('stargate_atlantis',_,_,Start), end('stargate_atlantis',_,_,End), Start=<End.

generate_facts_kim_possible_AND_stargate_atlantis([]) :- assert(kim_possible_AND_stargate_atlantis(-1,-1)).

generate_facts_kim_possible_AND_stargate_atlantis([(Start,End) | Tail]) :- assert(kim_possible_AND_stargate_atlantis(Start,End)), generate_facts_kim_possible_AND_stargate_atlantis(Tail).

kim_possible_AND_stargate_atlantis_aux() :- findall((Start,End),kim_possible(Start,End),Interval1), findall((Start,End),stargate_atlantis(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_kim_possible_AND_stargate_atlantis(Interval).

kim_possible_AND_stargate_atlantis_at_2005(Res) :- setof((Start,End),kim_possible_AND_stargate_atlantis(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = kim_possible_AND_stargate_atlantis_at_2005'), (kim_possible_AND_stargate_atlantis_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).
?- kim_possible_AND_stargate_atlantis_aux().

