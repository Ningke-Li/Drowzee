:- include('database.pl').
province_of_finland(Start,End) :- begin('province_of_finland',_,_,Start), end('province_of_finland',_,_,End), Start=<End.

queer_as_folk(Start,End) :- begin('queer_as_folk',_,_,Start), end('queer_as_folk',_,_,End), Start=<End.

generate_facts_province_of_finland_AND_queer_as_folk([]) :- assert(province_of_finland_AND_queer_as_folk(-1,-1)).

generate_facts_province_of_finland_AND_queer_as_folk([(Start,End) | Tail]) :- assert(province_of_finland_AND_queer_as_folk(Start,End)), generate_facts_province_of_finland_AND_queer_as_folk(Tail).

province_of_finland_AND_queer_as_folk_aux() :- findall((Start,End),province_of_finland(Start,End),Interval1), findall((Start,End),queer_as_folk(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_province_of_finland_AND_queer_as_folk(Interval).

province_of_finland_AND_queer_as_folk_at_1868(Res) :- setof((Start,End),province_of_finland_AND_queer_as_folk(Start,End),AllINtervals), checkvalidity(1868,AllINtervals,Res).

check_query() :- write('Query = province_of_finland_AND_queer_as_folk_at_1868'), (province_of_finland_AND_queer_as_folk_at_1868(true) -> write('\nRes   = true');write('\nRes   = false')).
?- province_of_finland_AND_queer_as_folk_aux().

