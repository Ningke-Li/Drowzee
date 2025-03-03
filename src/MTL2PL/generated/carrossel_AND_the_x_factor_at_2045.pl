:- include('database.pl').
carrossel(Start,End) :- begin('carrossel',_,_,Start), end('carrossel',_,_,End), Start=<End.

the_x_factor(Start,End) :- begin('the_x_factor',_,_,Start), end('the_x_factor',_,_,End), Start=<End.

generate_facts_carrossel_AND_the_x_factor([]) :- assert(carrossel_AND_the_x_factor(-1,-1)).

generate_facts_carrossel_AND_the_x_factor([(Start,End) | Tail]) :- assert(carrossel_AND_the_x_factor(Start,End)), generate_facts_carrossel_AND_the_x_factor(Tail).

carrossel_AND_the_x_factor_aux() :- findall((Start,End),carrossel(Start,End),Interval1), findall((Start,End),the_x_factor(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_carrossel_AND_the_x_factor(Interval).

carrossel_AND_the_x_factor_at_2045(Res) :- setof((Start,End),carrossel_AND_the_x_factor(Start,End),AllINtervals), checkvalidity(2045,AllINtervals,Res).

check_query() :- write('Query = carrossel_AND_the_x_factor_at_2045'), (carrossel_AND_the_x_factor_at_2045(true) -> write('\nRes   = true');write('\nRes   = false')).
?- carrossel_AND_the_x_factor_aux().

