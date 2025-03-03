:- include('database.pl').
livonian_war(Start,End) :- begin('livonian_war',_,_,Start), end('livonian_war',_,_,End), Start=<End.

ev_2009_united_nations_climate_change_conference(Start,End) :- begin('ev_2009_united_nations_climate_change_conference',_,_,Start), end('ev_2009_united_nations_climate_change_conference',_,_,End), Start=<End.

generate_facts_livonian_war_OR_ev_2009_united_nations_climate_change_conference([]) :- assert(livonian_war_OR_ev_2009_united_nations_climate_change_conference(-1,-1)).

generate_facts_livonian_war_OR_ev_2009_united_nations_climate_change_conference([(Start,End) | Tail]) :- assert(livonian_war_OR_ev_2009_united_nations_climate_change_conference(Start,End)), generate_facts_livonian_war_OR_ev_2009_united_nations_climate_change_conference(Tail).

livonian_war_OR_ev_2009_united_nations_climate_change_conference_aux() :- findall((Start,End),livonian_war(Start,End),Interval1), findall((Start,End),ev_2009_united_nations_climate_change_conference(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_livonian_war_OR_ev_2009_united_nations_climate_change_conference(Interval).

livonian_war_OR_ev_2009_united_nations_climate_change_conference_at_1887(Res) :- setof((Start,End),livonian_war_OR_ev_2009_united_nations_climate_change_conference(Start,End),AllINtervals), checkvalidity(1887,AllINtervals,Res).

check_query() :- write('Query = livonian_war_OR_ev_2009_united_nations_climate_change_conference_at_1887'), (livonian_war_OR_ev_2009_united_nations_climate_change_conference_at_1887(true) -> write('\nRes   = true');write('\nRes   = false')).
?- livonian_war_OR_ev_2009_united_nations_climate_change_conference_aux().

