:- include('database.pl').
enabling_act_of_1933(Start,End) :- begin('enabling_act_of_1933',_,_,Start), end('enabling_act_of_1933',_,_,End), Start=<End.

peseta(Start,End) :- begin('peseta',_,_,Start), end('peseta',_,_,End), Start=<End.

generate_facts_enabling_act_of_1933_AND_peseta([]) :- assert(enabling_act_of_1933_AND_peseta(-1,-1)).

generate_facts_enabling_act_of_1933_AND_peseta([(Start,End) | Tail]) :- assert(enabling_act_of_1933_AND_peseta(Start,End)), generate_facts_enabling_act_of_1933_AND_peseta(Tail).

enabling_act_of_1933_AND_peseta_aux() :- findall((Start,End),enabling_act_of_1933(Start,End),Interval1), findall((Start,End),peseta(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_enabling_act_of_1933_AND_peseta(Interval).

enabling_act_of_1933_AND_peseta_at_1874(Res) :- setof((Start,End),enabling_act_of_1933_AND_peseta(Start,End),AllINtervals), checkvalidity(1874,AllINtervals,Res).

check_query() :- write('Query = enabling_act_of_1933_AND_peseta_at_1874'), (enabling_act_of_1933_AND_peseta_at_1874(true) -> write('\nRes   = true');write('\nRes   = false')).
?- enabling_act_of_1933_AND_peseta_aux().

