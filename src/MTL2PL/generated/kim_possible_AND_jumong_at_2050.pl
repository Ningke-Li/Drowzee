:- include('database.pl').
kim_possible(Start,End) :- begin('kim_possible',_,_,Start), end('kim_possible',_,_,End), Start=<End.

jumong(Start,End) :- begin('jumong',_,_,Start), end('jumong',_,_,End), Start=<End.

generate_facts_kim_possible_AND_jumong([]) :- assert(kim_possible_AND_jumong(-1,-1)).

generate_facts_kim_possible_AND_jumong([(Start,End) | Tail]) :- assert(kim_possible_AND_jumong(Start,End)), generate_facts_kim_possible_AND_jumong(Tail).

kim_possible_AND_jumong_aux() :- findall((Start,End),kim_possible(Start,End),Interval1), findall((Start,End),jumong(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_kim_possible_AND_jumong(Interval).

kim_possible_AND_jumong_at_2050(Res) :- setof((Start,End),kim_possible_AND_jumong(Start,End),AllINtervals), checkvalidity(2050,AllINtervals,Res).

check_query() :- write('Query = kim_possible_AND_jumong_at_2050'), (kim_possible_AND_jumong_at_2050(true) -> write('\nRes   = true');write('\nRes   = false')).
?- kim_possible_AND_jumong_aux().

