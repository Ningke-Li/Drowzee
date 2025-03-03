:- include('database.pl').
westworld(Start,End) :- begin('westworld',_,_,Start), end('westworld',_,_,End), Start=<End.

the_4400(Start,End) :- begin('the_4400',_,_,Start), end('the_4400',_,_,End), Start=<End.

generate_facts_westworld_OR_the_4400([]) :- assert(westworld_OR_the_4400(-1,-1)).

generate_facts_westworld_OR_the_4400([(Start,End) | Tail]) :- assert(westworld_OR_the_4400(Start,End)), generate_facts_westworld_OR_the_4400(Tail).

westworld_OR_the_4400_aux() :- findall((Start,End),westworld(Start,End),Interval1), findall((Start,End),the_4400(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_westworld_OR_the_4400(Interval).

westworld_OR_the_4400_at_2040(Res) :- setof((Start,End),westworld_OR_the_4400(Start,End),AllINtervals), checkvalidity(2040,AllINtervals,Res).

check_query() :- write('Query = westworld_OR_the_4400_at_2040'), (westworld_OR_the_4400_at_2040(true) -> write('\nRes   = true');write('\nRes   = false')).
?- westworld_OR_the_4400_aux().

