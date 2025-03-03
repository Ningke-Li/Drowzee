:- include('database.pl').
sakoku(Start,End) :- begin('sakoku',_,_,Start), end('sakoku',_,_,End), Start=<End.

continental_system(Start,End) :- begin('continental_system',_,_,Start), end('continental_system',_,_,End), Start=<End.

generate_facts_sakoku_AND_continental_system([]) :- assert(sakoku_AND_continental_system(-1,-1)).

generate_facts_sakoku_AND_continental_system([(Start,End) | Tail]) :- assert(sakoku_AND_continental_system(Start,End)), generate_facts_sakoku_AND_continental_system(Tail).

sakoku_AND_continental_system_aux() :- findall((Start,End),sakoku(Start,End),Interval1), findall((Start,End),continental_system(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_sakoku_AND_continental_system(Interval).

sakoku_AND_continental_system_at_1786(Res) :- setof((Start,End),sakoku_AND_continental_system(Start,End),AllINtervals), checkvalidity(1786,AllINtervals,Res).

check_query() :- write('Query = sakoku_AND_continental_system_at_1786'), (sakoku_AND_continental_system_at_1786(true) -> write('\nRes   = true');write('\nRes   = false')).
?- sakoku_AND_continental_system_aux().

