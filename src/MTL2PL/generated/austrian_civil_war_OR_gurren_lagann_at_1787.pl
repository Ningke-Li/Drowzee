:- include('database.pl').
austrian_civil_war(Start,End) :- begin('austrian_civil_war',_,_,Start), end('austrian_civil_war',_,_,End), Start=<End.

gurren_lagann(Start,End) :- begin('gurren_lagann',_,_,Start), end('gurren_lagann',_,_,End), Start=<End.

generate_facts_austrian_civil_war_OR_gurren_lagann([]) :- assert(austrian_civil_war_OR_gurren_lagann(-1,-1)).

generate_facts_austrian_civil_war_OR_gurren_lagann([(Start,End) | Tail]) :- assert(austrian_civil_war_OR_gurren_lagann(Start,End)), generate_facts_austrian_civil_war_OR_gurren_lagann(Tail).

austrian_civil_war_OR_gurren_lagann_aux() :- findall((Start,End),austrian_civil_war(Start,End),Interval1), findall((Start,End),gurren_lagann(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_austrian_civil_war_OR_gurren_lagann(Interval).

austrian_civil_war_OR_gurren_lagann_at_1787(Res) :- setof((Start,End),austrian_civil_war_OR_gurren_lagann(Start,End),AllINtervals), checkvalidity(1787,AllINtervals,Res).

check_query() :- write('Query = austrian_civil_war_OR_gurren_lagann_at_1787'), (austrian_civil_war_OR_gurren_lagann_at_1787(true) -> write('\nRes   = true');write('\nRes   = false')).
?- austrian_civil_war_OR_gurren_lagann_aux().

