:- include('database.pl').
bones(Start,End) :- begin('bones',_,_,Start), end('bones',_,_,End), Start=<End.

greek_genocide(Start,End) :- begin('greek_genocide',_,_,Start), end('greek_genocide',_,_,End), Start=<End.

generate_facts_bones_OR_greek_genocide([]) :- assert(bones_OR_greek_genocide(-1,-1)).

generate_facts_bones_OR_greek_genocide([(Start,End) | Tail]) :- assert(bones_OR_greek_genocide(Start,End)), generate_facts_bones_OR_greek_genocide(Tail).

bones_OR_greek_genocide_aux() :- findall((Start,End),bones(Start,End),Interval1), findall((Start,End),greek_genocide(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_bones_OR_greek_genocide(Interval).

bones_OR_greek_genocide_at_1916(Res) :- setof((Start,End),bones_OR_greek_genocide(Start,End),AllINtervals), checkvalidity(1916,AllINtervals,Res).

check_query() :- write('Query = bones_OR_greek_genocide_at_1916'), (bones_OR_greek_genocide_at_1916(true) -> write('\nRes   = true');write('\nRes   = false')).
?- bones_OR_greek_genocide_aux().

