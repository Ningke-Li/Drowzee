:- include('database.pl').
sustainable_development_goals(Start,End) :- begin('sustainable_development_goals',_,_,Start), end('sustainable_development_goals',_,_,End), Start=<End.

ev_13_reasons_why(Start,End) :- begin('ev_13_reasons_why',_,_,Start), end('ev_13_reasons_why',_,_,End), Start=<End.

generate_facts_sustainable_development_goals_AND_ev_13_reasons_why([]) :- assert(sustainable_development_goals_AND_ev_13_reasons_why(-1,-1)).

generate_facts_sustainable_development_goals_AND_ev_13_reasons_why([(Start,End) | Tail]) :- assert(sustainable_development_goals_AND_ev_13_reasons_why(Start,End)), generate_facts_sustainable_development_goals_AND_ev_13_reasons_why(Tail).

sustainable_development_goals_AND_ev_13_reasons_why_aux() :- findall((Start,End),sustainable_development_goals(Start,End),Interval1), findall((Start,End),ev_13_reasons_why(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_sustainable_development_goals_AND_ev_13_reasons_why(Interval).

sustainable_development_goals_AND_ev_13_reasons_why_at_2020(Res) :- setof((Start,End),sustainable_development_goals_AND_ev_13_reasons_why(Start,End),AllINtervals), checkvalidity(2020,AllINtervals,Res).

check_query() :- write('Query = sustainable_development_goals_AND_ev_13_reasons_why_at_2020'), (sustainable_development_goals_AND_ev_13_reasons_why_at_2020(true) -> write('\nRes   = true');write('\nRes   = false')).
?- sustainable_development_goals_AND_ev_13_reasons_why_aux().

