:- include('database.pl').
luxembourg_franc(Start,End) :- begin('luxembourg_franc',_,_,Start), end('luxembourg_franc',_,_,End), Start=<End.

rif_war(Start,End) :- begin('rif_war',_,_,Start), end('rif_war',_,_,End), Start=<End.

generate_facts_luxembourg_franc_AND_rif_war([]) :- assert(luxembourg_franc_AND_rif_war(-1,-1)).

generate_facts_luxembourg_franc_AND_rif_war([(Start,End) | Tail]) :- assert(luxembourg_franc_AND_rif_war(Start,End)), generate_facts_luxembourg_franc_AND_rif_war(Tail).

luxembourg_franc_AND_rif_war_aux() :- findall((Start,End),luxembourg_franc(Start,End),Interval1), findall((Start,End),rif_war(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_luxembourg_franc_AND_rif_war(Interval).

luxembourg_franc_AND_rif_war_at_1914(Res) :- setof((Start,End),luxembourg_franc_AND_rif_war(Start,End),AllINtervals), checkvalidity(1914,AllINtervals,Res).

check_query() :- write('Query = luxembourg_franc_AND_rif_war_at_1914'), (luxembourg_franc_AND_rif_war_at_1914(true) -> write('\nRes   = true');write('\nRes   = false')).
?- luxembourg_franc_AND_rif_war_aux().

