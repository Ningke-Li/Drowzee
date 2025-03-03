:- include('database.pl').
merlin(Start,End) :- begin('merlin',_,_,Start), end('merlin',_,_,End), Start=<End.

lewis_and_clark_expedition(Start,End) :- begin('lewis_and_clark_expedition',_,_,Start), end('lewis_and_clark_expedition',_,_,End), Start=<End.

generate_facts_merlin_OR_lewis_and_clark_expedition([]) :- assert(merlin_OR_lewis_and_clark_expedition(-1,-1)).

generate_facts_merlin_OR_lewis_and_clark_expedition([(Start,End) | Tail]) :- assert(merlin_OR_lewis_and_clark_expedition(Start,End)), generate_facts_merlin_OR_lewis_and_clark_expedition(Tail).

merlin_OR_lewis_and_clark_expedition_aux() :- findall((Start,End),merlin(Start,End),Interval1), findall((Start,End),lewis_and_clark_expedition(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_merlin_OR_lewis_and_clark_expedition(Interval).

merlin_OR_lewis_and_clark_expedition_at_1730(Res) :- setof((Start,End),merlin_OR_lewis_and_clark_expedition(Start,End),AllINtervals), checkvalidity(1730,AllINtervals,Res).

check_query() :- write('Query = merlin_OR_lewis_and_clark_expedition_at_1730'), (merlin_OR_lewis_and_clark_expedition_at_1730(true) -> write('\nRes   = true');write('\nRes   = false')).
?- merlin_OR_lewis_and_clark_expedition_aux().

