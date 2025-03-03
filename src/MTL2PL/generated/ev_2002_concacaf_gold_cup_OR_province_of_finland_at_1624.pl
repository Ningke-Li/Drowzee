:- include('database.pl').
ev_2002_concacaf_gold_cup(Start,End) :- begin('ev_2002_concacaf_gold_cup',_,_,Start), end('ev_2002_concacaf_gold_cup',_,_,End), Start=<End.

province_of_finland(Start,End) :- begin('province_of_finland',_,_,Start), end('province_of_finland',_,_,End), Start=<End.

generate_facts_ev_2002_concacaf_gold_cup_OR_province_of_finland([]) :- assert(ev_2002_concacaf_gold_cup_OR_province_of_finland(-1,-1)).

generate_facts_ev_2002_concacaf_gold_cup_OR_province_of_finland([(Start,End) | Tail]) :- assert(ev_2002_concacaf_gold_cup_OR_province_of_finland(Start,End)), generate_facts_ev_2002_concacaf_gold_cup_OR_province_of_finland(Tail).

ev_2002_concacaf_gold_cup_OR_province_of_finland_aux() :- findall((Start,End),ev_2002_concacaf_gold_cup(Start,End),Interval1), findall((Start,End),province_of_finland(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2002_concacaf_gold_cup_OR_province_of_finland(Interval).

ev_2002_concacaf_gold_cup_OR_province_of_finland_at_1624(Res) :- setof((Start,End),ev_2002_concacaf_gold_cup_OR_province_of_finland(Start,End),AllINtervals), checkvalidity(1624,AllINtervals,Res).

check_query() :- write('Query = ev_2002_concacaf_gold_cup_OR_province_of_finland_at_1624'), (ev_2002_concacaf_gold_cup_OR_province_of_finland_at_1624(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2002_concacaf_gold_cup_OR_province_of_finland_aux().

