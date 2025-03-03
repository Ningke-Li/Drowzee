:- include('database.pl').
ev_13_reasons_why(Start,End) :- begin('ev_13_reasons_why',_,_,Start), end('ev_13_reasons_why',_,_,End), Start=<End.

ev_2001_fifa_confederations_cup(Start,End) :- begin('ev_2001_fifa_confederations_cup',_,_,Start), end('ev_2001_fifa_confederations_cup',_,_,End), Start=<End.

generate_facts_ev_13_reasons_why_OR_ev_2001_fifa_confederations_cup([]) :- assert(ev_13_reasons_why_OR_ev_2001_fifa_confederations_cup(-1,-1)).

generate_facts_ev_13_reasons_why_OR_ev_2001_fifa_confederations_cup([(Start,End) | Tail]) :- assert(ev_13_reasons_why_OR_ev_2001_fifa_confederations_cup(Start,End)), generate_facts_ev_13_reasons_why_OR_ev_2001_fifa_confederations_cup(Tail).

ev_13_reasons_why_OR_ev_2001_fifa_confederations_cup_aux() :- findall((Start,End),ev_13_reasons_why(Start,End),Interval1), findall((Start,End),ev_2001_fifa_confederations_cup(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_13_reasons_why_OR_ev_2001_fifa_confederations_cup(Interval).

ev_13_reasons_why_OR_ev_2001_fifa_confederations_cup_at_2034(Res) :- setof((Start,End),ev_13_reasons_why_OR_ev_2001_fifa_confederations_cup(Start,End),AllINtervals), checkvalidity(2034,AllINtervals,Res).

check_query() :- write('Query = ev_13_reasons_why_OR_ev_2001_fifa_confederations_cup_at_2034'), (ev_13_reasons_why_OR_ev_2001_fifa_confederations_cup_at_2034(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_13_reasons_why_OR_ev_2001_fifa_confederations_cup_aux().

