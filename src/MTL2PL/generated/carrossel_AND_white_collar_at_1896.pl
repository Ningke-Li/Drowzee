:- include('database.pl').
carrossel(Start,End) :- begin('carrossel',_,_,Start), end('carrossel',_,_,End), Start=<End.

white_collar(Start,End) :- begin('white_collar',_,_,Start), end('white_collar',_,_,End), Start=<End.

generate_facts_carrossel_AND_white_collar([]) :- assert(carrossel_AND_white_collar(-1,-1)).

generate_facts_carrossel_AND_white_collar([(Start,End) | Tail]) :- assert(carrossel_AND_white_collar(Start,End)), generate_facts_carrossel_AND_white_collar(Tail).

carrossel_AND_white_collar_aux() :- findall((Start,End),carrossel(Start,End),Interval1), findall((Start,End),white_collar(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_carrossel_AND_white_collar(Interval).

carrossel_AND_white_collar_at_1896(Res) :- setof((Start,End),carrossel_AND_white_collar(Start,End),AllINtervals), checkvalidity(1896,AllINtervals,Res).

check_query() :- write('Query = carrossel_AND_white_collar_at_1896'), (carrossel_AND_white_collar_at_1896(true) -> write('\nRes   = true');write('\nRes   = false')).
?- carrossel_AND_white_collar_aux().

