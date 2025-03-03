:- include('database.pl').
ev_2009_concacaf_gold_cup(Start,End) :- begin('ev_2009_concacaf_gold_cup',_,_,Start), end('ev_2009_concacaf_gold_cup',_,_,End), Start=<End.

february_2015(Start,End) :- begin('february_2015',_,_,Start), end('february_2015',_,_,End), Start=<End.

generate_facts_ev_2009_concacaf_gold_cup_OR_february_2015([]) :- assert(ev_2009_concacaf_gold_cup_OR_february_2015(-1,-1)).

generate_facts_ev_2009_concacaf_gold_cup_OR_february_2015([(Start,End) | Tail]) :- assert(ev_2009_concacaf_gold_cup_OR_february_2015(Start,End)), generate_facts_ev_2009_concacaf_gold_cup_OR_february_2015(Tail).

ev_2009_concacaf_gold_cup_OR_february_2015_aux() :- findall((Start,End),ev_2009_concacaf_gold_cup(Start,End),Interval1), findall((Start,End),february_2015(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2009_concacaf_gold_cup_OR_february_2015(Interval).

ev_2009_concacaf_gold_cup_OR_february_2015_at_2056(Res) :- setof((Start,End),ev_2009_concacaf_gold_cup_OR_february_2015(Start,End),AllINtervals), checkvalidity(2056,AllINtervals,Res).

check_query() :- write('Query = ev_2009_concacaf_gold_cup_OR_february_2015_at_2056'), (ev_2009_concacaf_gold_cup_OR_february_2015_at_2056(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2009_concacaf_gold_cup_OR_february_2015_aux().

