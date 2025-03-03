:- include('database.pl').
little_entente(Start,End) :- begin('little_entente',_,_,Start), end('little_entente',_,_,End), Start=<End.

weeds(Start,End) :- begin('weeds',_,_,Start), end('weeds',_,_,End), Start=<End.

generate_facts_little_entente_OR_weeds([]) :- assert(little_entente_OR_weeds(-1,-1)).

generate_facts_little_entente_OR_weeds([(Start,End) | Tail]) :- assert(little_entente_OR_weeds(Start,End)), generate_facts_little_entente_OR_weeds(Tail).

little_entente_OR_weeds_aux() :- findall((Start,End),little_entente(Start,End),Interval1), findall((Start,End),weeds(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_little_entente_OR_weeds(Interval).

little_entente_OR_weeds_at_1983(Res) :- setof((Start,End),little_entente_OR_weeds(Start,End),AllINtervals), checkvalidity(1983,AllINtervals,Res).

check_query() :- write('Query = little_entente_OR_weeds_at_1983'), (little_entente_OR_weeds_at_1983(true) -> write('\nRes   = true');write('\nRes   = false')).
?- little_entente_OR_weeds_aux().

