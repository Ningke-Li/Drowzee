:- include('database.pl').
banana_wars(Start,End) :- begin('banana_wars',_,_,Start), end('banana_wars',_,_,End), Start=<End.

k_the_kollwitz(Start,End) :- begin('k_the_kollwitz',_,_,Start), end('k_the_kollwitz',_,_,End), Start=<End.

generate_facts_banana_wars_AND_k_the_kollwitz([]) :- assert(banana_wars_AND_k_the_kollwitz(-1,-1)).

generate_facts_banana_wars_AND_k_the_kollwitz([(Start,End) | Tail]) :- assert(banana_wars_AND_k_the_kollwitz(Start,End)), generate_facts_banana_wars_AND_k_the_kollwitz(Tail).

banana_wars_AND_k_the_kollwitz_aux() :- findall((Start,End),banana_wars(Start,End),Interval1), findall((Start,End),k_the_kollwitz(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_banana_wars_AND_k_the_kollwitz(Interval).

banana_wars_AND_k_the_kollwitz_at_1915(Res) :- setof((Start,End),banana_wars_AND_k_the_kollwitz(Start,End),AllINtervals), checkvalidity(1915,AllINtervals,Res).

check_query() :- write('Query = banana_wars_AND_k_the_kollwitz_at_1915'), (banana_wars_AND_k_the_kollwitz_at_1915(true) -> write('\nRes   = true');write('\nRes   = false')).
?- banana_wars_AND_k_the_kollwitz_aux().

