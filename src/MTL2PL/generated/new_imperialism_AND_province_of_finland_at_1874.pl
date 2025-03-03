:- include('database.pl').
new_imperialism(Start,End) :- begin('new_imperialism',_,_,Start), end('new_imperialism',_,_,End), Start=<End.

province_of_finland(Start,End) :- begin('province_of_finland',_,_,Start), end('province_of_finland',_,_,End), Start=<End.

generate_facts_new_imperialism_AND_province_of_finland([]) :- assert(new_imperialism_AND_province_of_finland(-1,-1)).

generate_facts_new_imperialism_AND_province_of_finland([(Start,End) | Tail]) :- assert(new_imperialism_AND_province_of_finland(Start,End)), generate_facts_new_imperialism_AND_province_of_finland(Tail).

new_imperialism_AND_province_of_finland_aux() :- findall((Start,End),new_imperialism(Start,End),Interval1), findall((Start,End),province_of_finland(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_new_imperialism_AND_province_of_finland(Interval).

new_imperialism_AND_province_of_finland_at_1874(Res) :- setof((Start,End),new_imperialism_AND_province_of_finland(Start,End),AllINtervals), checkvalidity(1874,AllINtervals,Res).

check_query() :- write('Query = new_imperialism_AND_province_of_finland_at_1874'), (new_imperialism_AND_province_of_finland_at_1874(true) -> write('\nRes   = true');write('\nRes   = false')).
?- new_imperialism_AND_province_of_finland_aux().

