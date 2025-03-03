:- include('database.pl').
skins(Start,End) :- begin('skins',_,_,Start), end('skins',_,_,End), Start=<End.

province_of_finland(Start,End) :- begin('province_of_finland',_,_,Start), end('province_of_finland',_,_,End), Start=<End.

generate_facts_skins_AND_province_of_finland([]) :- assert(skins_AND_province_of_finland(-1,-1)).

generate_facts_skins_AND_province_of_finland([(Start,End) | Tail]) :- assert(skins_AND_province_of_finland(Start,End)), generate_facts_skins_AND_province_of_finland(Tail).

skins_AND_province_of_finland_aux() :- findall((Start,End),skins(Start,End),Interval1), findall((Start,End),province_of_finland(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_skins_AND_province_of_finland(Interval).

skins_AND_province_of_finland_at_1882(Res) :- setof((Start,End),skins_AND_province_of_finland(Start,End),AllINtervals), checkvalidity(1882,AllINtervals,Res).

check_query() :- write('Query = skins_AND_province_of_finland_at_1882'), (skins_AND_province_of_finland_at_1882(true) -> write('\nRes   = true');write('\nRes   = false')).
?- skins_AND_province_of_finland_aux().

