:- include('database.pl').
balkan_wars(Start,End) :- begin('balkan_wars',_,_,Start), end('balkan_wars',_,_,End), Start=<End.

scramble_for_africa(Start,End) :- begin('scramble_for_africa',_,_,Start), end('scramble_for_africa',_,_,End), Start=<End.

generate_facts_balkan_wars_OR_scramble_for_africa([]) :- assert(balkan_wars_OR_scramble_for_africa(-1,-1)).

generate_facts_balkan_wars_OR_scramble_for_africa([(Start,End) | Tail]) :- assert(balkan_wars_OR_scramble_for_africa(Start,End)), generate_facts_balkan_wars_OR_scramble_for_africa(Tail).

balkan_wars_OR_scramble_for_africa_aux() :- findall((Start,End),balkan_wars(Start,End),Interval1), findall((Start,End),scramble_for_africa(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_balkan_wars_OR_scramble_for_africa(Interval).

balkan_wars_OR_scramble_for_africa_at_1917(Res) :- setof((Start,End),balkan_wars_OR_scramble_for_africa(Start,End),AllINtervals), checkvalidity(1917,AllINtervals,Res).

check_query() :- write('Query = balkan_wars_OR_scramble_for_africa_at_1917'), (balkan_wars_OR_scramble_for_africa_at_1917(true) -> write('\nRes   = true');write('\nRes   = false')).
?- balkan_wars_OR_scramble_for_africa_aux().

