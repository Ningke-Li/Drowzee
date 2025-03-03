:- include('database.pl').
shimabara_rebellion(Start,End) :- begin('shimabara_rebellion',_,_,Start), end('shimabara_rebellion',_,_,End), Start=<End.

wars_of_the_roses(Start,End) :- begin('wars_of_the_roses',_,_,Start), end('wars_of_the_roses',_,_,End), Start=<End.

generate_facts_shimabara_rebellion_OR_wars_of_the_roses([]) :- assert(shimabara_rebellion_OR_wars_of_the_roses(-1,-1)).

generate_facts_shimabara_rebellion_OR_wars_of_the_roses([(Start,End) | Tail]) :- assert(shimabara_rebellion_OR_wars_of_the_roses(Start,End)), generate_facts_shimabara_rebellion_OR_wars_of_the_roses(Tail).

shimabara_rebellion_OR_wars_of_the_roses_aux() :- findall((Start,End),shimabara_rebellion(Start,End),Interval1), findall((Start,End),wars_of_the_roses(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_shimabara_rebellion_OR_wars_of_the_roses(Interval).

shimabara_rebellion_OR_wars_of_the_roses_at_1502(Res) :- setof((Start,End),shimabara_rebellion_OR_wars_of_the_roses(Start,End),AllINtervals), checkvalidity(1502,AllINtervals,Res).

check_query() :- write('Query = shimabara_rebellion_OR_wars_of_the_roses_at_1502'), (shimabara_rebellion_OR_wars_of_the_roses_at_1502(true) -> write('\nRes   = true');write('\nRes   = false')).
?- shimabara_rebellion_OR_wars_of_the_roses_aux().

