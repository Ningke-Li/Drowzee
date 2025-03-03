:- include('database.pl').
new_imperialism(Start,End) :- begin('new_imperialism',_,_,Start), end('new_imperialism',_,_,End), Start=<End.

macedonian_front(Start,End) :- begin('macedonian_front',_,_,Start), end('macedonian_front',_,_,End), Start=<End.

generate_facts_new_imperialism_AND_macedonian_front([]) :- assert(new_imperialism_AND_macedonian_front(-1,-1)).

generate_facts_new_imperialism_AND_macedonian_front([(Start,End) | Tail]) :- assert(new_imperialism_AND_macedonian_front(Start,End)), generate_facts_new_imperialism_AND_macedonian_front(Tail).

new_imperialism_AND_macedonian_front_aux() :- findall((Start,End),new_imperialism(Start,End),Interval1), findall((Start,End),macedonian_front(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_new_imperialism_AND_macedonian_front(Interval).

new_imperialism_AND_macedonian_front_at_1917(Res) :- setof((Start,End),new_imperialism_AND_macedonian_front(Start,End),AllINtervals), checkvalidity(1917,AllINtervals,Res).

check_query() :- write('Query = new_imperialism_AND_macedonian_front_at_1917'), (new_imperialism_AND_macedonian_front_at_1917(true) -> write('\nRes   = true');write('\nRes   = false')).
?- new_imperialism_AND_macedonian_front_aux().

