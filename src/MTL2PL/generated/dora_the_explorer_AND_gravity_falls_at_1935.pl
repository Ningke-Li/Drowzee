:- include('database.pl').
dora_the_explorer(Start,End) :- begin('dora_the_explorer',_,_,Start), end('dora_the_explorer',_,_,End), Start=<End.

gravity_falls(Start,End) :- begin('gravity_falls',_,_,Start), end('gravity_falls',_,_,End), Start=<End.

generate_facts_dora_the_explorer_AND_gravity_falls([]) :- assert(dora_the_explorer_AND_gravity_falls(-1,-1)).

generate_facts_dora_the_explorer_AND_gravity_falls([(Start,End) | Tail]) :- assert(dora_the_explorer_AND_gravity_falls(Start,End)), generate_facts_dora_the_explorer_AND_gravity_falls(Tail).

dora_the_explorer_AND_gravity_falls_aux() :- findall((Start,End),dora_the_explorer(Start,End),Interval1), findall((Start,End),gravity_falls(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_dora_the_explorer_AND_gravity_falls(Interval).

dora_the_explorer_AND_gravity_falls_at_1935(Res) :- setof((Start,End),dora_the_explorer_AND_gravity_falls(Start,End),AllINtervals), checkvalidity(1935,AllINtervals,Res).

check_query() :- write('Query = dora_the_explorer_AND_gravity_falls_at_1935'), (dora_the_explorer_AND_gravity_falls_at_1935(true) -> write('\nRes   = true');write('\nRes   = false')).
?- dora_the_explorer_AND_gravity_falls_aux().

