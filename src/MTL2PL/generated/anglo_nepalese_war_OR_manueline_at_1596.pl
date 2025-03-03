:- include('database.pl').
anglo_nepalese_war(Start,End) :- begin('anglo_nepalese_war',_,_,Start), end('anglo_nepalese_war',_,_,End), Start=<End.

manueline(Start,End) :- begin('manueline',_,_,Start), end('manueline',_,_,End), Start=<End.

generate_facts_anglo_nepalese_war_OR_manueline([]) :- assert(anglo_nepalese_war_OR_manueline(-1,-1)).

generate_facts_anglo_nepalese_war_OR_manueline([(Start,End) | Tail]) :- assert(anglo_nepalese_war_OR_manueline(Start,End)), generate_facts_anglo_nepalese_war_OR_manueline(Tail).

anglo_nepalese_war_OR_manueline_aux() :- findall((Start,End),anglo_nepalese_war(Start,End),Interval1), findall((Start,End),manueline(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_anglo_nepalese_war_OR_manueline(Interval).

anglo_nepalese_war_OR_manueline_at_1596(Res) :- setof((Start,End),anglo_nepalese_war_OR_manueline(Start,End),AllINtervals), checkvalidity(1596,AllINtervals,Res).

check_query() :- write('Query = anglo_nepalese_war_OR_manueline_at_1596'), (anglo_nepalese_war_OR_manueline_at_1596(true) -> write('\nRes   = true');write('\nRes   = false')).
?- anglo_nepalese_war_OR_manueline_aux().

