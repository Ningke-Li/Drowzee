:- include('database.pl').
irish_war_of_independence(Start,End) :- begin('irish_war_of_independence',_,_,Start), end('irish_war_of_independence',_,_,End), Start=<End.

wars_of_the_roses(Start,End) :- begin('wars_of_the_roses',_,_,Start), end('wars_of_the_roses',_,_,End), Start=<End.

generate_facts_irish_war_of_independence_OR_wars_of_the_roses([]) :- assert(irish_war_of_independence_OR_wars_of_the_roses(-1,-1)).

generate_facts_irish_war_of_independence_OR_wars_of_the_roses([(Start,End) | Tail]) :- assert(irish_war_of_independence_OR_wars_of_the_roses(Start,End)), generate_facts_irish_war_of_independence_OR_wars_of_the_roses(Tail).

irish_war_of_independence_OR_wars_of_the_roses_aux() :- findall((Start,End),irish_war_of_independence(Start,End),Interval1), findall((Start,End),wars_of_the_roses(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_irish_war_of_independence_OR_wars_of_the_roses(Interval).

irish_war_of_independence_OR_wars_of_the_roses_at_1470(Res) :- setof((Start,End),irish_war_of_independence_OR_wars_of_the_roses(Start,End),AllINtervals), checkvalidity(1470,AllINtervals,Res).

check_query() :- write('Query = irish_war_of_independence_OR_wars_of_the_roses_at_1470'), (irish_war_of_independence_OR_wars_of_the_roses_at_1470(true) -> write('\nRes   = true');write('\nRes   = false')).
?- irish_war_of_independence_OR_wars_of_the_roses_aux().

