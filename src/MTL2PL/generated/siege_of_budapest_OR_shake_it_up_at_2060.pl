:- include('database.pl').
siege_of_budapest(Start,End) :- begin('siege_of_budapest',_,_,Start), end('siege_of_budapest',_,_,End), Start=<End.

shake_it_up(Start,End) :- begin('shake_it_up',_,_,Start), end('shake_it_up',_,_,End), Start=<End.

generate_facts_siege_of_budapest_OR_shake_it_up([]) :- assert(siege_of_budapest_OR_shake_it_up(-1,-1)).

generate_facts_siege_of_budapest_OR_shake_it_up([(Start,End) | Tail]) :- assert(siege_of_budapest_OR_shake_it_up(Start,End)), generate_facts_siege_of_budapest_OR_shake_it_up(Tail).

siege_of_budapest_OR_shake_it_up_aux() :- findall((Start,End),siege_of_budapest(Start,End),Interval1), findall((Start,End),shake_it_up(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_siege_of_budapest_OR_shake_it_up(Interval).

siege_of_budapest_OR_shake_it_up_at_2060(Res) :- setof((Start,End),siege_of_budapest_OR_shake_it_up(Start,End),AllINtervals), checkvalidity(2060,AllINtervals,Res).

check_query() :- write('Query = siege_of_budapest_OR_shake_it_up_at_2060'), (siege_of_budapest_OR_shake_it_up_at_2060(true) -> write('\nRes   = true');write('\nRes   = false')).
?- siege_of_budapest_OR_shake_it_up_aux().

