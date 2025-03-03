:- include('database.pl').
the_x_factor(Start,End) :- begin('the_x_factor',_,_,Start), end('the_x_factor',_,_,End), Start=<End.

greek_civil_war(Start,End) :- begin('greek_civil_war',_,_,Start), end('greek_civil_war',_,_,End), Start=<End.

generate_facts_the_x_factor_OR_greek_civil_war([]) :- assert(the_x_factor_OR_greek_civil_war(-1,-1)).

generate_facts_the_x_factor_OR_greek_civil_war([(Start,End) | Tail]) :- assert(the_x_factor_OR_greek_civil_war(Start,End)), generate_facts_the_x_factor_OR_greek_civil_war(Tail).

the_x_factor_OR_greek_civil_war_aux() :- findall((Start,End),the_x_factor(Start,End),Interval1), findall((Start,End),greek_civil_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_the_x_factor_OR_greek_civil_war(Interval).

the_x_factor_OR_greek_civil_war_at_1888(Res) :- setof((Start,End),the_x_factor_OR_greek_civil_war(Start,End),AllINtervals), checkvalidity(1888,AllINtervals,Res).

check_query() :- write('Query = the_x_factor_OR_greek_civil_war_at_1888'), (the_x_factor_OR_greek_civil_war_at_1888(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_x_factor_OR_greek_civil_war_aux().

