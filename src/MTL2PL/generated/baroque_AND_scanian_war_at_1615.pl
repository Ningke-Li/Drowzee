:- include('database.pl').
baroque(Start,End) :- begin('baroque',_,_,Start), end('baroque',_,_,End), Start=<End.

scanian_war(Start,End) :- begin('scanian_war',_,_,Start), end('scanian_war',_,_,End), Start=<End.

generate_facts_baroque_AND_scanian_war([]) :- assert(baroque_AND_scanian_war(-1,-1)).

generate_facts_baroque_AND_scanian_war([(Start,End) | Tail]) :- assert(baroque_AND_scanian_war(Start,End)), generate_facts_baroque_AND_scanian_war(Tail).

baroque_AND_scanian_war_aux() :- findall((Start,End),baroque(Start,End),Interval1), findall((Start,End),scanian_war(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_baroque_AND_scanian_war(Interval).

baroque_AND_scanian_war_at_1615(Res) :- setof((Start,End),baroque_AND_scanian_war(Start,End),AllINtervals), checkvalidity(1615,AllINtervals,Res).

check_query() :- write('Query = baroque_AND_scanian_war_at_1615'), (baroque_AND_scanian_war_at_1615(true) -> write('\nRes   = true');write('\nRes   = false')).
?- baroque_AND_scanian_war_aux().

