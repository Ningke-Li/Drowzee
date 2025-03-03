:- include('database.pl').
vostok_programme(Start,End) :- begin('vostok_programme',_,_,Start), end('vostok_programme',_,_,End), Start=<End.

nanjing_massacre(Start,End) :- begin('nanjing_massacre',_,_,Start), end('nanjing_massacre',_,_,End), Start=<End.

generate_facts_vostok_programme_OR_nanjing_massacre([]) :- assert(vostok_programme_OR_nanjing_massacre(-1,-1)).

generate_facts_vostok_programme_OR_nanjing_massacre([(Start,End) | Tail]) :- assert(vostok_programme_OR_nanjing_massacre(Start,End)), generate_facts_vostok_programme_OR_nanjing_massacre(Tail).

vostok_programme_OR_nanjing_massacre_aux() :- findall((Start,End),vostok_programme(Start,End),Interval1), findall((Start,End),nanjing_massacre(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_vostok_programme_OR_nanjing_massacre(Interval).

vostok_programme_OR_nanjing_massacre_at_1934(Res) :- setof((Start,End),vostok_programme_OR_nanjing_massacre(Start,End),AllINtervals), checkvalidity(1934,AllINtervals,Res).

check_query() :- write('Query = vostok_programme_OR_nanjing_massacre_at_1934'), (vostok_programme_OR_nanjing_massacre_at_1934(true) -> write('\nRes   = true');write('\nRes   = false')).
?- vostok_programme_OR_nanjing_massacre_aux().

