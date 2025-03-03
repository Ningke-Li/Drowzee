:- include('database.pl').
jumong(Start,End) :- begin('jumong',_,_,Start), end('jumong',_,_,End), Start=<End.

desperate_housewives(Start,End) :- begin('desperate_housewives',_,_,Start), end('desperate_housewives',_,_,End), Start=<End.

generate_facts_jumong_AND_desperate_housewives([]) :- assert(jumong_AND_desperate_housewives(-1,-1)).

generate_facts_jumong_AND_desperate_housewives([(Start,End) | Tail]) :- assert(jumong_AND_desperate_housewives(Start,End)), generate_facts_jumong_AND_desperate_housewives(Tail).

jumong_AND_desperate_housewives_aux() :- findall((Start,End),jumong(Start,End),Interval1), findall((Start,End),desperate_housewives(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_jumong_AND_desperate_housewives(Interval).

jumong_AND_desperate_housewives_at_1956(Res) :- setof((Start,End),jumong_AND_desperate_housewives(Start,End),AllINtervals), checkvalidity(1956,AllINtervals,Res).

check_query() :- write('Query = jumong_AND_desperate_housewives_at_1956'), (jumong_AND_desperate_housewives_at_1956(true) -> write('\nRes   = true');write('\nRes   = false')).
?- jumong_AND_desperate_housewives_aux().

