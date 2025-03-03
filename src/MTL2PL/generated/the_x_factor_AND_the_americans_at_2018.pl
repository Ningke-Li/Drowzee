:- include('database.pl').
the_x_factor(Start,End) :- begin('the_x_factor',_,_,Start), end('the_x_factor',_,_,End), Start=<End.

the_americans(Start,End) :- begin('the_americans',_,_,Start), end('the_americans',_,_,End), Start=<End.

generate_facts_the_x_factor_AND_the_americans([]) :- assert(the_x_factor_AND_the_americans(-1,-1)).

generate_facts_the_x_factor_AND_the_americans([(Start,End) | Tail]) :- assert(the_x_factor_AND_the_americans(Start,End)), generate_facts_the_x_factor_AND_the_americans(Tail).

the_x_factor_AND_the_americans_aux() :- findall((Start,End),the_x_factor(Start,End),Interval1), findall((Start,End),the_americans(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_x_factor_AND_the_americans(Interval).

the_x_factor_AND_the_americans_at_2018(Res) :- setof((Start,End),the_x_factor_AND_the_americans(Start,End),AllINtervals), checkvalidity(2018,AllINtervals,Res).

check_query() :- write('Query = the_x_factor_AND_the_americans_at_2018'), (the_x_factor_AND_the_americans_at_2018(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_x_factor_AND_the_americans_aux().

