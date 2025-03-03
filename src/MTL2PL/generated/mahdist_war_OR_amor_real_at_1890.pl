:- include('database.pl').
mahdist_war(Start,End) :- begin('mahdist_war',_,_,Start), end('mahdist_war',_,_,End), Start=<End.

amor_real(Start,End) :- begin('amor_real',_,_,Start), end('amor_real',_,_,End), Start=<End.

generate_facts_mahdist_war_OR_amor_real([]) :- assert(mahdist_war_OR_amor_real(-1,-1)).

generate_facts_mahdist_war_OR_amor_real([(Start,End) | Tail]) :- assert(mahdist_war_OR_amor_real(Start,End)), generate_facts_mahdist_war_OR_amor_real(Tail).

mahdist_war_OR_amor_real_aux() :- findall((Start,End),mahdist_war(Start,End),Interval1), findall((Start,End),amor_real(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_mahdist_war_OR_amor_real(Interval).

mahdist_war_OR_amor_real_at_1890(Res) :- setof((Start,End),mahdist_war_OR_amor_real(Start,End),AllINtervals), checkvalidity(1890,AllINtervals,Res).

check_query() :- write('Query = mahdist_war_OR_amor_real_at_1890'), (mahdist_war_OR_amor_real_at_1890(true) -> write('\nRes   = true');write('\nRes   = false')).
?- mahdist_war_OR_amor_real_aux().

