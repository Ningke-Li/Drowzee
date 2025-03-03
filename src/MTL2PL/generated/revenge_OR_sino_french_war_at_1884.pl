:- include('database.pl').
revenge(Start,End) :- begin('revenge',_,_,Start), end('revenge',_,_,End), Start=<End.

sino_french_war(Start,End) :- begin('sino_french_war',_,_,Start), end('sino_french_war',_,_,End), Start=<End.

generate_facts_revenge_OR_sino_french_war([]) :- assert(revenge_OR_sino_french_war(-1,-1)).

generate_facts_revenge_OR_sino_french_war([(Start,End) | Tail]) :- assert(revenge_OR_sino_french_war(Start,End)), generate_facts_revenge_OR_sino_french_war(Tail).

revenge_OR_sino_french_war_aux() :- findall((Start,End),revenge(Start,End),Interval1), findall((Start,End),sino_french_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_revenge_OR_sino_french_war(Interval).

revenge_OR_sino_french_war_at_1884(Res) :- setof((Start,End),revenge_OR_sino_french_war(Start,End),AllINtervals), checkvalidity(1884,AllINtervals,Res).

check_query() :- write('Query = revenge_OR_sino_french_war_at_1884'), (revenge_OR_sino_french_war_at_1884(true) -> write('\nRes   = true');write('\nRes   = false')).
?- revenge_OR_sino_french_war_aux().

