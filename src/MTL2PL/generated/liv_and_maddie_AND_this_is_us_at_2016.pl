:- include('database.pl').
liv_and_maddie(Start,End) :- begin('liv_and_maddie',_,_,Start), end('liv_and_maddie',_,_,End), Start=<End.

this_is_us(Start,End) :- begin('this_is_us',_,_,Start), end('this_is_us',_,_,End), Start=<End.

generate_facts_liv_and_maddie_AND_this_is_us([]) :- assert(liv_and_maddie_AND_this_is_us(-1,-1)).

generate_facts_liv_and_maddie_AND_this_is_us([(Start,End) | Tail]) :- assert(liv_and_maddie_AND_this_is_us(Start,End)), generate_facts_liv_and_maddie_AND_this_is_us(Tail).

liv_and_maddie_AND_this_is_us_aux() :- findall((Start,End),liv_and_maddie(Start,End),Interval1), findall((Start,End),this_is_us(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_liv_and_maddie_AND_this_is_us(Interval).

liv_and_maddie_AND_this_is_us_at_2016(Res) :- setof((Start,End),liv_and_maddie_AND_this_is_us(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = liv_and_maddie_AND_this_is_us_at_2016'), (liv_and_maddie_AND_this_is_us_at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).
?- liv_and_maddie_AND_this_is_us_aux().

