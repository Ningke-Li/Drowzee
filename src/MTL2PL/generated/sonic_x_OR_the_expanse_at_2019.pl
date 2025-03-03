:- include('database.pl').
sonic_x(Start,End) :- begin('sonic_x',_,_,Start), end('sonic_x',_,_,End), Start=<End.

the_expanse(Start,End) :- begin('the_expanse',_,_,Start), end('the_expanse',_,_,End), Start=<End.

generate_facts_sonic_x_OR_the_expanse([]) :- assert(sonic_x_OR_the_expanse(-1,-1)).

generate_facts_sonic_x_OR_the_expanse([(Start,End) | Tail]) :- assert(sonic_x_OR_the_expanse(Start,End)), generate_facts_sonic_x_OR_the_expanse(Tail).

sonic_x_OR_the_expanse_aux() :- findall((Start,End),sonic_x(Start,End),Interval1), findall((Start,End),the_expanse(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_sonic_x_OR_the_expanse(Interval).

sonic_x_OR_the_expanse_at_2019(Res) :- setof((Start,End),sonic_x_OR_the_expanse(Start,End),AllINtervals), checkvalidity(2019,AllINtervals,Res).

check_query() :- write('Query = sonic_x_OR_the_expanse_at_2019'), (sonic_x_OR_the_expanse_at_2019(true) -> write('\nRes   = true');write('\nRes   = false')).
?- sonic_x_OR_the_expanse_aux().

