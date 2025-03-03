:- include('database.pl').
the_x_factor(Start,End) :- begin('the_x_factor',_,_,Start), end('the_x_factor',_,_,End), Start=<End.

austin___ally(Start,End) :- begin('austin___ally',_,_,Start), end('austin___ally',_,_,End), Start=<End.

generate_facts_the_x_factor_AND_austin___ally([]) :- assert(the_x_factor_AND_austin___ally(-1,-1)).

generate_facts_the_x_factor_AND_austin___ally([(Start,End) | Tail]) :- assert(the_x_factor_AND_austin___ally(Start,End)), generate_facts_the_x_factor_AND_austin___ally(Tail).

the_x_factor_AND_austin___ally_aux() :- findall((Start,End),the_x_factor(Start,End),Interval1), findall((Start,End),austin___ally(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_x_factor_AND_austin___ally(Interval).

the_x_factor_AND_austin___ally_at_1871(Res) :- setof((Start,End),the_x_factor_AND_austin___ally(Start,End),AllINtervals), checkvalidity(1871,AllINtervals,Res).

check_query() :- write('Query = the_x_factor_AND_austin___ally_at_1871'), (the_x_factor_AND_austin___ally_at_1871(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_x_factor_AND_austin___ally_aux().

