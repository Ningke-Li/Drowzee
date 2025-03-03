:- include('database.pl').
kronstadt_rebellion(Start,End) :- begin('kronstadt_rebellion',_,_,Start), end('kronstadt_rebellion',_,_,End), Start=<End.

ev_2016_ofc_nations_cup(Start,End) :- begin('ev_2016_ofc_nations_cup',_,_,Start), end('ev_2016_ofc_nations_cup',_,_,End), Start=<End.

generate_facts_kronstadt_rebellion_OR_ev_2016_ofc_nations_cup([]) :- assert(kronstadt_rebellion_OR_ev_2016_ofc_nations_cup(-1,-1)).

generate_facts_kronstadt_rebellion_OR_ev_2016_ofc_nations_cup([(Start,End) | Tail]) :- assert(kronstadt_rebellion_OR_ev_2016_ofc_nations_cup(Start,End)), generate_facts_kronstadt_rebellion_OR_ev_2016_ofc_nations_cup(Tail).

kronstadt_rebellion_OR_ev_2016_ofc_nations_cup_aux() :- findall((Start,End),kronstadt_rebellion(Start,End),Interval1), findall((Start,End),ev_2016_ofc_nations_cup(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_kronstadt_rebellion_OR_ev_2016_ofc_nations_cup(Interval).

kronstadt_rebellion_OR_ev_2016_ofc_nations_cup_at_1926(Res) :- setof((Start,End),kronstadt_rebellion_OR_ev_2016_ofc_nations_cup(Start,End),AllINtervals), checkvalidity(1926,AllINtervals,Res).

check_query() :- write('Query = kronstadt_rebellion_OR_ev_2016_ofc_nations_cup_at_1926'), (kronstadt_rebellion_OR_ev_2016_ofc_nations_cup_at_1926(true) -> write('\nRes   = true');write('\nRes   = false')).
?- kronstadt_rebellion_OR_ev_2016_ofc_nations_cup_aux().

