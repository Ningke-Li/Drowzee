:- include('database.pl').
greek_civil_war(Start,End) :- begin('greek_civil_war',_,_,Start), end('greek_civil_war',_,_,End), Start=<End.

tom_and_jerry(Start,End) :- begin('tom_and_jerry',_,_,Start), end('tom_and_jerry',_,_,End), Start=<End.

generate_facts_greek_civil_war_AND_tom_and_jerry([]) :- assert(greek_civil_war_AND_tom_and_jerry(-1,-1)).

generate_facts_greek_civil_war_AND_tom_and_jerry([(Start,End) | Tail]) :- assert(greek_civil_war_AND_tom_and_jerry(Start,End)), generate_facts_greek_civil_war_AND_tom_and_jerry(Tail).

greek_civil_war_AND_tom_and_jerry_aux() :- findall((Start,End),greek_civil_war(Start,End),Interval1), findall((Start,End),tom_and_jerry(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_greek_civil_war_AND_tom_and_jerry(Interval).

greek_civil_war_AND_tom_and_jerry_at_1797(Res) :- setof((Start,End),greek_civil_war_AND_tom_and_jerry(Start,End),AllINtervals), checkvalidity(1797,AllINtervals,Res).

check_query() :- write('Query = greek_civil_war_AND_tom_and_jerry_at_1797'), (greek_civil_war_AND_tom_and_jerry_at_1797(true) -> write('\nRes   = true');write('\nRes   = false')).
?- greek_civil_war_AND_tom_and_jerry_aux().

