:- include('database.pl').
beslan_school_siege(Start,End) :- begin('beslan_school_siege',_,_,Start), end('beslan_school_siege',_,_,End), Start=<End.

council_of_constance(Start,End) :- begin('council_of_constance',_,_,Start), end('council_of_constance',_,_,End), Start=<End.

generate_facts_beslan_school_siege_OR_council_of_constance([]) :- assert(beslan_school_siege_OR_council_of_constance(-1,-1)).

generate_facts_beslan_school_siege_OR_council_of_constance([(Start,End) | Tail]) :- assert(beslan_school_siege_OR_council_of_constance(Start,End)), generate_facts_beslan_school_siege_OR_council_of_constance(Tail).

beslan_school_siege_OR_council_of_constance_aux() :- findall((Start,End),beslan_school_siege(Start,End),Interval1), findall((Start,End),council_of_constance(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_beslan_school_siege_OR_council_of_constance(Interval).

beslan_school_siege_OR_council_of_constance_at_2038(Res) :- setof((Start,End),beslan_school_siege_OR_council_of_constance(Start,End),AllINtervals), checkvalidity(2038,AllINtervals,Res).

check_query() :- write('Query = beslan_school_siege_OR_council_of_constance_at_2038'), (beslan_school_siege_OR_council_of_constance_at_2038(true) -> write('\nRes   = true');write('\nRes   = false')).
?- beslan_school_siege_OR_council_of_constance_aux().

