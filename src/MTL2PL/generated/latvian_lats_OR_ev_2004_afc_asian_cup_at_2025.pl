:- include('database.pl').
latvian_lats(Start,End) :- begin('latvian_lats',_,_,Start), end('latvian_lats',_,_,End), Start=<End.

ev_2004_afc_asian_cup(Start,End) :- begin('ev_2004_afc_asian_cup',_,_,Start), end('ev_2004_afc_asian_cup',_,_,End), Start=<End.

generate_facts_latvian_lats_OR_ev_2004_afc_asian_cup([]) :- assert(latvian_lats_OR_ev_2004_afc_asian_cup(-1,-1)).

generate_facts_latvian_lats_OR_ev_2004_afc_asian_cup([(Start,End) | Tail]) :- assert(latvian_lats_OR_ev_2004_afc_asian_cup(Start,End)), generate_facts_latvian_lats_OR_ev_2004_afc_asian_cup(Tail).

latvian_lats_OR_ev_2004_afc_asian_cup_aux() :- findall((Start,End),latvian_lats(Start,End),Interval1), findall((Start,End),ev_2004_afc_asian_cup(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_latvian_lats_OR_ev_2004_afc_asian_cup(Interval).

latvian_lats_OR_ev_2004_afc_asian_cup_at_2025(Res) :- setof((Start,End),latvian_lats_OR_ev_2004_afc_asian_cup(Start,End),AllINtervals), checkvalidity(2025,AllINtervals,Res).

check_query() :- write('Query = latvian_lats_OR_ev_2004_afc_asian_cup_at_2025'), (latvian_lats_OR_ev_2004_afc_asian_cup_at_2025(true) -> write('\nRes   = true');write('\nRes   = false')).
?- latvian_lats_OR_ev_2004_afc_asian_cup_aux().

