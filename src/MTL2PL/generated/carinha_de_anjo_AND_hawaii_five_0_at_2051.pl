:- include('database.pl').
carinha_de_anjo(Start,End) :- begin('carinha_de_anjo',_,_,Start), end('carinha_de_anjo',_,_,End), Start=<End.

hawaii_five_0(Start,End) :- begin('hawaii_five_0',_,_,Start), end('hawaii_five_0',_,_,End), Start=<End.

generate_facts_carinha_de_anjo_AND_hawaii_five_0([]) :- assert(carinha_de_anjo_AND_hawaii_five_0(-1,-1)).

generate_facts_carinha_de_anjo_AND_hawaii_five_0([(Start,End) | Tail]) :- assert(carinha_de_anjo_AND_hawaii_five_0(Start,End)), generate_facts_carinha_de_anjo_AND_hawaii_five_0(Tail).

carinha_de_anjo_AND_hawaii_five_0_aux() :- findall((Start,End),carinha_de_anjo(Start,End),Interval1), findall((Start,End),hawaii_five_0(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_carinha_de_anjo_AND_hawaii_five_0(Interval).

carinha_de_anjo_AND_hawaii_five_0_at_2051(Res) :- setof((Start,End),carinha_de_anjo_AND_hawaii_five_0(Start,End),AllINtervals), checkvalidity(2051,AllINtervals,Res).

check_query() :- write('Query = carinha_de_anjo_AND_hawaii_five_0_at_2051'), (carinha_de_anjo_AND_hawaii_five_0_at_2051(true) -> write('\nRes   = true');write('\nRes   = false')).
?- carinha_de_anjo_AND_hawaii_five_0_aux().

