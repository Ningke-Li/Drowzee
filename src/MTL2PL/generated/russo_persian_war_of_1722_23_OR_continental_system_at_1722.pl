:- include('database.pl').
russo_persian_war_of_1722_23(Start,End) :- begin('russo_persian_war_of_1722_23',_,_,Start), end('russo_persian_war_of_1722_23',_,_,End), Start=<End.

continental_system(Start,End) :- begin('continental_system',_,_,Start), end('continental_system',_,_,End), Start=<End.

generate_facts_russo_persian_war_of_1722_23_OR_continental_system([]) :- assert(russo_persian_war_of_1722_23_OR_continental_system(-1,-1)).

generate_facts_russo_persian_war_of_1722_23_OR_continental_system([(Start,End) | Tail]) :- assert(russo_persian_war_of_1722_23_OR_continental_system(Start,End)), generate_facts_russo_persian_war_of_1722_23_OR_continental_system(Tail).

russo_persian_war_of_1722_23_OR_continental_system_aux() :- findall((Start,End),russo_persian_war_of_1722_23(Start,End),Interval1), findall((Start,End),continental_system(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_russo_persian_war_of_1722_23_OR_continental_system(Interval).

russo_persian_war_of_1722_23_OR_continental_system_at_1722(Res) :- setof((Start,End),russo_persian_war_of_1722_23_OR_continental_system(Start,End),AllINtervals), checkvalidity(1722,AllINtervals,Res).

check_query() :- write('Query = russo_persian_war_of_1722_23_OR_continental_system_at_1722'), (russo_persian_war_of_1722_23_OR_continental_system_at_1722(true) -> write('\nRes   = true');write('\nRes   = false')).
?- russo_persian_war_of_1722_23_OR_continental_system_aux().

