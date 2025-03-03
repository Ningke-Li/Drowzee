:- include('database.pl').
phoney_war(Start,End) :- begin('phoney_war',_,_,Start), end('phoney_war',_,_,End), Start=<End.

ev_1936_soviet_constitution(Start,End) :- begin('ev_1936_soviet_constitution',_,_,Start), end('ev_1936_soviet_constitution',_,_,End), Start=<End.

generate_facts_phoney_war_OR_ev_1936_soviet_constitution([]) :- assert(phoney_war_OR_ev_1936_soviet_constitution(-1,-1)).

generate_facts_phoney_war_OR_ev_1936_soviet_constitution([(Start,End) | Tail]) :- assert(phoney_war_OR_ev_1936_soviet_constitution(Start,End)), generate_facts_phoney_war_OR_ev_1936_soviet_constitution(Tail).

phoney_war_OR_ev_1936_soviet_constitution_aux() :- findall((Start,End),phoney_war(Start,End),Interval1), findall((Start,End),ev_1936_soviet_constitution(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_phoney_war_OR_ev_1936_soviet_constitution(Interval).

phoney_war_OR_ev_1936_soviet_constitution_at_1966(Res) :- setof((Start,End),phoney_war_OR_ev_1936_soviet_constitution(Start,End),AllINtervals), checkvalidity(1966,AllINtervals,Res).

check_query() :- write('Query = phoney_war_OR_ev_1936_soviet_constitution_at_1966'), (phoney_war_OR_ev_1936_soviet_constitution_at_1966(true) -> write('\nRes   = true');write('\nRes   = false')).
?- phoney_war_OR_ev_1936_soviet_constitution_aux().

