:- include('database.pl').
ev__nin_war(Start,End) :- begin('ev__nin_war',_,_,Start), end('ev__nin_war',_,_,End), Start=<End.

battle_of_h_rtgen_forest(Start,End) :- begin('battle_of_h_rtgen_forest',_,_,Start), end('battle_of_h_rtgen_forest',_,_,End), Start=<End.

generate_facts_ev__nin_war_OR_battle_of_h_rtgen_forest([]) :- assert(ev__nin_war_OR_battle_of_h_rtgen_forest(-1,-1)).

generate_facts_ev__nin_war_OR_battle_of_h_rtgen_forest([(Start,End) | Tail]) :- assert(ev__nin_war_OR_battle_of_h_rtgen_forest(Start,End)), generate_facts_ev__nin_war_OR_battle_of_h_rtgen_forest(Tail).

ev__nin_war_OR_battle_of_h_rtgen_forest_aux() :- findall((Start,End),ev__nin_war(Start,End),Interval1), findall((Start,End),battle_of_h_rtgen_forest(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev__nin_war_OR_battle_of_h_rtgen_forest(Interval).

ev__nin_war_OR_battle_of_h_rtgen_forest_at_1893(Res) :- setof((Start,End),ev__nin_war_OR_battle_of_h_rtgen_forest(Start,End),AllINtervals), checkvalidity(1893,AllINtervals,Res).

check_query() :- write('Query = ev__nin_war_OR_battle_of_h_rtgen_forest_at_1893'), (ev__nin_war_OR_battle_of_h_rtgen_forest_at_1893(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev__nin_war_OR_battle_of_h_rtgen_forest_aux().

