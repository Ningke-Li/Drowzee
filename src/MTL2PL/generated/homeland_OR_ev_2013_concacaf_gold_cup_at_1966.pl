:- include('database.pl').
homeland(Start,End) :- begin('homeland',_,_,Start), end('homeland',_,_,End), Start=<End.

ev_2013_concacaf_gold_cup(Start,End) :- begin('ev_2013_concacaf_gold_cup',_,_,Start), end('ev_2013_concacaf_gold_cup',_,_,End), Start=<End.

generate_facts_homeland_OR_ev_2013_concacaf_gold_cup([]) :- assert(homeland_OR_ev_2013_concacaf_gold_cup(-1,-1)).

generate_facts_homeland_OR_ev_2013_concacaf_gold_cup([(Start,End) | Tail]) :- assert(homeland_OR_ev_2013_concacaf_gold_cup(Start,End)), generate_facts_homeland_OR_ev_2013_concacaf_gold_cup(Tail).

homeland_OR_ev_2013_concacaf_gold_cup_aux() :- findall((Start,End),homeland(Start,End),Interval1), findall((Start,End),ev_2013_concacaf_gold_cup(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_homeland_OR_ev_2013_concacaf_gold_cup(Interval).

homeland_OR_ev_2013_concacaf_gold_cup_at_1966(Res) :- setof((Start,End),homeland_OR_ev_2013_concacaf_gold_cup(Start,End),AllINtervals), checkvalidity(1966,AllINtervals,Res).

check_query() :- write('Query = homeland_OR_ev_2013_concacaf_gold_cup_at_1966'), (homeland_OR_ev_2013_concacaf_gold_cup_at_1966(true) -> write('\nRes   = true');write('\nRes   = false')).
?- homeland_OR_ev_2013_concacaf_gold_cup_aux().

