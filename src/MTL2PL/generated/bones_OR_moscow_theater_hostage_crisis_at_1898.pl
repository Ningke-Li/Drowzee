:- include('database.pl').
bones(Start,End) :- begin('bones',_,_,Start), end('bones',_,_,End), Start=<End.

moscow_theater_hostage_crisis(Start,End) :- begin('moscow_theater_hostage_crisis',_,_,Start), end('moscow_theater_hostage_crisis',_,_,End), Start=<End.

generate_facts_bones_OR_moscow_theater_hostage_crisis([]) :- assert(bones_OR_moscow_theater_hostage_crisis(-1,-1)).

generate_facts_bones_OR_moscow_theater_hostage_crisis([(Start,End) | Tail]) :- assert(bones_OR_moscow_theater_hostage_crisis(Start,End)), generate_facts_bones_OR_moscow_theater_hostage_crisis(Tail).

bones_OR_moscow_theater_hostage_crisis_aux() :- findall((Start,End),bones(Start,End),Interval1), findall((Start,End),moscow_theater_hostage_crisis(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_bones_OR_moscow_theater_hostage_crisis(Interval).

bones_OR_moscow_theater_hostage_crisis_at_1898(Res) :- setof((Start,End),bones_OR_moscow_theater_hostage_crisis(Start,End),AllINtervals), checkvalidity(1898,AllINtervals,Res).

check_query() :- write('Query = bones_OR_moscow_theater_hostage_crisis_at_1898'), (bones_OR_moscow_theater_hostage_crisis_at_1898(true) -> write('\nRes   = true');write('\nRes   = false')).
?- bones_OR_moscow_theater_hostage_crisis_aux().

