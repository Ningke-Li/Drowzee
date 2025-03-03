:- include('database.pl').
ev_2013_fifa_confederations_cup(Start,End) :- begin('ev_2013_fifa_confederations_cup',_,_,Start), end('ev_2013_fifa_confederations_cup',_,_,End), Start=<End.

eighty_years__war(Start,End) :- begin('eighty_years__war',_,_,Start), end('eighty_years__war',_,_,End), Start=<End.

generate_facts_ev_2013_fifa_confederations_cup_OR_eighty_years__war([]) :- assert(ev_2013_fifa_confederations_cup_OR_eighty_years__war(-1,-1)).

generate_facts_ev_2013_fifa_confederations_cup_OR_eighty_years__war([(Start,End) | Tail]) :- assert(ev_2013_fifa_confederations_cup_OR_eighty_years__war(Start,End)), generate_facts_ev_2013_fifa_confederations_cup_OR_eighty_years__war(Tail).

ev_2013_fifa_confederations_cup_OR_eighty_years__war_aux() :- findall((Start,End),ev_2013_fifa_confederations_cup(Start,End),Interval1), findall((Start,End),eighty_years__war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2013_fifa_confederations_cup_OR_eighty_years__war(Interval).

ev_2013_fifa_confederations_cup_OR_eighty_years__war_at_1661(Res) :- setof((Start,End),ev_2013_fifa_confederations_cup_OR_eighty_years__war(Start,End),AllINtervals), checkvalidity(1661,AllINtervals,Res).

check_query() :- write('Query = ev_2013_fifa_confederations_cup_OR_eighty_years__war_at_1661'), (ev_2013_fifa_confederations_cup_OR_eighty_years__war_at_1661(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2013_fifa_confederations_cup_OR_eighty_years__war_aux().

