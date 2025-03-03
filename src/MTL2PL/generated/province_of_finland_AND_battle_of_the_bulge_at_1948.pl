:- include('database.pl').
province_of_finland(Start,End) :- begin('province_of_finland',_,_,Start), end('province_of_finland',_,_,End), Start=<End.

battle_of_the_bulge(Start,End) :- begin('battle_of_the_bulge',_,_,Start), end('battle_of_the_bulge',_,_,End), Start=<End.

generate_facts_province_of_finland_AND_battle_of_the_bulge([]) :- assert(province_of_finland_AND_battle_of_the_bulge(-1,-1)).

generate_facts_province_of_finland_AND_battle_of_the_bulge([(Start,End) | Tail]) :- assert(province_of_finland_AND_battle_of_the_bulge(Start,End)), generate_facts_province_of_finland_AND_battle_of_the_bulge(Tail).

province_of_finland_AND_battle_of_the_bulge_aux() :- findall((Start,End),province_of_finland(Start,End),Interval1), findall((Start,End),battle_of_the_bulge(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_province_of_finland_AND_battle_of_the_bulge(Interval).

province_of_finland_AND_battle_of_the_bulge_at_1948(Res) :- setof((Start,End),province_of_finland_AND_battle_of_the_bulge(Start,End),AllINtervals), checkvalidity(1948,AllINtervals,Res).

check_query() :- write('Query = province_of_finland_AND_battle_of_the_bulge_at_1948'), (province_of_finland_AND_battle_of_the_bulge_at_1948(true) -> write('\nRes   = true');write('\nRes   = false')).
?- province_of_finland_AND_battle_of_the_bulge_aux().

