:- include('database.pl').
vostok_programme(Start,End) :- begin('vostok_programme',_,_,Start), end('vostok_programme',_,_,End), Start=<End.

fear_the_walking_dead(Start,End) :- begin('fear_the_walking_dead',_,_,Start), end('fear_the_walking_dead',_,_,End), Start=<End.

generate_facts_vostok_programme_AND_fear_the_walking_dead([]) :- assert(vostok_programme_AND_fear_the_walking_dead(-1,-1)).

generate_facts_vostok_programme_AND_fear_the_walking_dead([(Start,End) | Tail]) :- assert(vostok_programme_AND_fear_the_walking_dead(Start,End)), generate_facts_vostok_programme_AND_fear_the_walking_dead(Tail).

vostok_programme_AND_fear_the_walking_dead_aux() :- findall((Start,End),vostok_programme(Start,End),Interval1), findall((Start,End),fear_the_walking_dead(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_vostok_programme_AND_fear_the_walking_dead(Interval).

vostok_programme_AND_fear_the_walking_dead_at_1961(Res) :- setof((Start,End),vostok_programme_AND_fear_the_walking_dead(Start,End),AllINtervals), checkvalidity(1961,AllINtervals,Res).

check_query() :- write('Query = vostok_programme_AND_fear_the_walking_dead_at_1961'), (vostok_programme_AND_fear_the_walking_dead_at_1961(true) -> write('\nRes   = true');write('\nRes   = false')).
?- vostok_programme_AND_fear_the_walking_dead_aux().

