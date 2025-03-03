:- include('database.pl').
estonian_war_of_independence(Start,End) :- begin('estonian_war_of_independence',_,_,Start), end('estonian_war_of_independence',_,_,End), Start=<End.

portuguese_escudo(Start,End) :- begin('portuguese_escudo',_,_,Start), end('portuguese_escudo',_,_,End), Start=<End.

generate_facts_estonian_war_of_independence_AND_portuguese_escudo([]) :- assert(estonian_war_of_independence_AND_portuguese_escudo(-1,-1)).

generate_facts_estonian_war_of_independence_AND_portuguese_escudo([(Start,End) | Tail]) :- assert(estonian_war_of_independence_AND_portuguese_escudo(Start,End)), generate_facts_estonian_war_of_independence_AND_portuguese_escudo(Tail).

estonian_war_of_independence_AND_portuguese_escudo_aux() :- findall((Start,End),estonian_war_of_independence(Start,End),Interval1), findall((Start,End),portuguese_escudo(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_estonian_war_of_independence_AND_portuguese_escudo(Interval).

estonian_war_of_independence_AND_portuguese_escudo_at_1807(Res) :- setof((Start,End),estonian_war_of_independence_AND_portuguese_escudo(Start,End),AllINtervals), checkvalidity(1807,AllINtervals,Res).

check_query() :- write('Query = estonian_war_of_independence_AND_portuguese_escudo_at_1807'), (estonian_war_of_independence_AND_portuguese_escudo_at_1807(true) -> write('\nRes   = true');write('\nRes   = false')).
?- estonian_war_of_independence_AND_portuguese_escudo_aux().

