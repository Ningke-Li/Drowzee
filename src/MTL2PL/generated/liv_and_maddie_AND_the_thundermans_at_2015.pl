:- include('database.pl').
liv_and_maddie(Start,End) :- begin('liv_and_maddie',_,_,Start), end('liv_and_maddie',_,_,End), Start=<End.

the_thundermans(Start,End) :- begin('the_thundermans',_,_,Start), end('the_thundermans',_,_,End), Start=<End.

generate_facts_liv_and_maddie_AND_the_thundermans([]) :- assert(liv_and_maddie_AND_the_thundermans(-1,-1)).

generate_facts_liv_and_maddie_AND_the_thundermans([(Start,End) | Tail]) :- assert(liv_and_maddie_AND_the_thundermans(Start,End)), generate_facts_liv_and_maddie_AND_the_thundermans(Tail).

liv_and_maddie_AND_the_thundermans_aux() :- findall((Start,End),liv_and_maddie(Start,End),Interval1), findall((Start,End),the_thundermans(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_liv_and_maddie_AND_the_thundermans(Interval).

liv_and_maddie_AND_the_thundermans_at_2015(Res) :- setof((Start,End),liv_and_maddie_AND_the_thundermans(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = liv_and_maddie_AND_the_thundermans_at_2015'), (liv_and_maddie_AND_the_thundermans_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).
?- liv_and_maddie_AND_the_thundermans_aux().

