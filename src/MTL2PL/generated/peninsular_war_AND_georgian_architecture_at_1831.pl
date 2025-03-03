:- include('database.pl').
peninsular_war(Start,End) :- begin('peninsular_war',_,_,Start), end('peninsular_war',_,_,End), Start=<End.

georgian_architecture(Start,End) :- begin('georgian_architecture',_,_,Start), end('georgian_architecture',_,_,End), Start=<End.

generate_facts_peninsular_war_AND_georgian_architecture([]) :- assert(peninsular_war_AND_georgian_architecture(-1,-1)).

generate_facts_peninsular_war_AND_georgian_architecture([(Start,End) | Tail]) :- assert(peninsular_war_AND_georgian_architecture(Start,End)), generate_facts_peninsular_war_AND_georgian_architecture(Tail).

peninsular_war_AND_georgian_architecture_aux() :- findall((Start,End),peninsular_war(Start,End),Interval1), findall((Start,End),georgian_architecture(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_peninsular_war_AND_georgian_architecture(Interval).

peninsular_war_AND_georgian_architecture_at_1831(Res) :- setof((Start,End),peninsular_war_AND_georgian_architecture(Start,End),AllINtervals), checkvalidity(1831,AllINtervals,Res).

check_query() :- write('Query = peninsular_war_AND_georgian_architecture_at_1831'), (peninsular_war_AND_georgian_architecture_at_1831(true) -> write('\nRes   = true');write('\nRes   = false')).
?- peninsular_war_AND_georgian_architecture_aux().

