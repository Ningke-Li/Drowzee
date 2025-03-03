:- include('database.pl').
ev_2007_concacaf_gold_cup(Start,End) :- begin('ev_2007_concacaf_gold_cup',_,_,Start), end('ev_2007_concacaf_gold_cup',_,_,End), Start=<End.

vatican_lira(Start,End) :- begin('vatican_lira',_,_,Start), end('vatican_lira',_,_,End), Start=<End.

generate_facts_ev_2007_concacaf_gold_cup_OR_vatican_lira([]) :- assert(ev_2007_concacaf_gold_cup_OR_vatican_lira(-1,-1)).

generate_facts_ev_2007_concacaf_gold_cup_OR_vatican_lira([(Start,End) | Tail]) :- assert(ev_2007_concacaf_gold_cup_OR_vatican_lira(Start,End)), generate_facts_ev_2007_concacaf_gold_cup_OR_vatican_lira(Tail).

ev_2007_concacaf_gold_cup_OR_vatican_lira_aux() :- findall((Start,End),ev_2007_concacaf_gold_cup(Start,End),Interval1), findall((Start,End),vatican_lira(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2007_concacaf_gold_cup_OR_vatican_lira(Interval).

ev_2007_concacaf_gold_cup_OR_vatican_lira_at_1943(Res) :- setof((Start,End),ev_2007_concacaf_gold_cup_OR_vatican_lira(Start,End),AllINtervals), checkvalidity(1943,AllINtervals,Res).

check_query() :- write('Query = ev_2007_concacaf_gold_cup_OR_vatican_lira_at_1943'), (ev_2007_concacaf_gold_cup_OR_vatican_lira_at_1943(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2007_concacaf_gold_cup_OR_vatican_lira_aux().

