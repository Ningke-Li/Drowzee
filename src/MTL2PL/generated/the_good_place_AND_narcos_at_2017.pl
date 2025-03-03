:- include('database.pl').
the_good_place(Start,End) :- begin('the_good_place',_,_,Start), end('the_good_place',_,_,End), Start=<End.

narcos(Start,End) :- begin('narcos',_,_,Start), end('narcos',_,_,End), Start=<End.

generate_facts_the_good_place_AND_narcos([]) :- assert(the_good_place_AND_narcos(-1,-1)).

generate_facts_the_good_place_AND_narcos([(Start,End) | Tail]) :- assert(the_good_place_AND_narcos(Start,End)), generate_facts_the_good_place_AND_narcos(Tail).

the_good_place_AND_narcos_aux() :- findall((Start,End),the_good_place(Start,End),Interval1), findall((Start,End),narcos(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_good_place_AND_narcos(Interval).

the_good_place_AND_narcos_at_2017(Res) :- setof((Start,End),the_good_place_AND_narcos(Start,End),AllINtervals), checkvalidity(2017,AllINtervals,Res).

check_query() :- write('Query = the_good_place_AND_narcos_at_2017'), (the_good_place_AND_narcos_at_2017(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_good_place_AND_narcos_aux().

