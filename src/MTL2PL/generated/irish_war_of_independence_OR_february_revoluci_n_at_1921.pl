:- include('database.pl').
irish_war_of_independence(Start,End) :- begin('irish_war_of_independence',_,_,Start), end('irish_war_of_independence',_,_,End), Start=<End.

february_revoluci_n(Start,End) :- begin('february_revoluci_n',_,_,Start), end('february_revoluci_n',_,_,End), Start=<End.

generate_facts_irish_war_of_independence_OR_february_revoluci_n([]) :- assert(irish_war_of_independence_OR_february_revoluci_n(-1,-1)).

generate_facts_irish_war_of_independence_OR_february_revoluci_n([(Start,End) | Tail]) :- assert(irish_war_of_independence_OR_february_revoluci_n(Start,End)), generate_facts_irish_war_of_independence_OR_february_revoluci_n(Tail).

irish_war_of_independence_OR_february_revoluci_n_aux() :- findall((Start,End),irish_war_of_independence(Start,End),Interval1), findall((Start,End),february_revoluci_n(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_irish_war_of_independence_OR_february_revoluci_n(Interval).

irish_war_of_independence_OR_february_revoluci_n_at_1921(Res) :- setof((Start,End),irish_war_of_independence_OR_february_revoluci_n(Start,End),AllINtervals), checkvalidity(1921,AllINtervals,Res).

check_query() :- write('Query = irish_war_of_independence_OR_february_revoluci_n_at_1921'), (irish_war_of_independence_OR_february_revoluci_n_at_1921(true) -> write('\nRes   = true');write('\nRes   = false')).
?- irish_war_of_independence_OR_february_revoluci_n_aux().

