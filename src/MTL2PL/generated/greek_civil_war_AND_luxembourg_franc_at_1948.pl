:- include('database.pl').
greek_civil_war(Start,End) :- begin('greek_civil_war',_,_,Start), end('greek_civil_war',_,_,End), Start=<End.

luxembourg_franc(Start,End) :- begin('luxembourg_franc',_,_,Start), end('luxembourg_franc',_,_,End), Start=<End.

generate_facts_greek_civil_war_AND_luxembourg_franc([]) :- assert(greek_civil_war_AND_luxembourg_franc(-1,-1)).

generate_facts_greek_civil_war_AND_luxembourg_franc([(Start,End) | Tail]) :- assert(greek_civil_war_AND_luxembourg_franc(Start,End)), generate_facts_greek_civil_war_AND_luxembourg_franc(Tail).

greek_civil_war_AND_luxembourg_franc_aux() :- findall((Start,End),greek_civil_war(Start,End),Interval1), findall((Start,End),luxembourg_franc(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_greek_civil_war_AND_luxembourg_franc(Interval).

greek_civil_war_AND_luxembourg_franc_at_1948(Res) :- setof((Start,End),greek_civil_war_AND_luxembourg_franc(Start,End),AllINtervals), checkvalidity(1948,AllINtervals,Res).

check_query() :- write('Query = greek_civil_war_AND_luxembourg_franc_at_1948'), (greek_civil_war_AND_luxembourg_franc_at_1948(true) -> write('\nRes   = true');write('\nRes   = false')).
?- greek_civil_war_AND_luxembourg_franc_aux().

