:- include('database.pl').
province_of_finland(Start,End) :- begin('province_of_finland',_,_,Start), end('province_of_finland',_,_,End), Start=<End.

hungarian_revolution_of_1848(Start,End) :- begin('hungarian_revolution_of_1848',_,_,Start), end('hungarian_revolution_of_1848',_,_,End), Start=<End.

generate_facts_province_of_finland_AND_hungarian_revolution_of_1848([]) :- assert(province_of_finland_AND_hungarian_revolution_of_1848(-1,-1)).

generate_facts_province_of_finland_AND_hungarian_revolution_of_1848([(Start,End) | Tail]) :- assert(province_of_finland_AND_hungarian_revolution_of_1848(Start,End)), generate_facts_province_of_finland_AND_hungarian_revolution_of_1848(Tail).

province_of_finland_AND_hungarian_revolution_of_1848_aux() :- findall((Start,End),province_of_finland(Start,End),Interval1), findall((Start,End),hungarian_revolution_of_1848(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_province_of_finland_AND_hungarian_revolution_of_1848(Interval).

province_of_finland_AND_hungarian_revolution_of_1848_at_1812(Res) :- setof((Start,End),province_of_finland_AND_hungarian_revolution_of_1848(Start,End),AllINtervals), checkvalidity(1812,AllINtervals,Res).

check_query() :- write('Query = province_of_finland_AND_hungarian_revolution_of_1848_at_1812'), (province_of_finland_AND_hungarian_revolution_of_1848_at_1812(true) -> write('\nRes   = true');write('\nRes   = false')).
?- province_of_finland_AND_hungarian_revolution_of_1848_aux().

