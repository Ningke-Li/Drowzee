:- include('database.pl').
ev_2011_afc_asian_cup(Start,End) :- begin('ev_2011_afc_asian_cup',_,_,Start), end('ev_2011_afc_asian_cup',_,_,End), Start=<End.

imperial_trans_antarctic_expedition(Start,End) :- begin('imperial_trans_antarctic_expedition',_,_,Start), end('imperial_trans_antarctic_expedition',_,_,End), Start=<End.

generate_facts_ev_2011_afc_asian_cup_OR_imperial_trans_antarctic_expedition([]) :- assert(ev_2011_afc_asian_cup_OR_imperial_trans_antarctic_expedition(-1,-1)).

generate_facts_ev_2011_afc_asian_cup_OR_imperial_trans_antarctic_expedition([(Start,End) | Tail]) :- assert(ev_2011_afc_asian_cup_OR_imperial_trans_antarctic_expedition(Start,End)), generate_facts_ev_2011_afc_asian_cup_OR_imperial_trans_antarctic_expedition(Tail).

ev_2011_afc_asian_cup_OR_imperial_trans_antarctic_expedition_aux() :- findall((Start,End),ev_2011_afc_asian_cup(Start,End),Interval1), findall((Start,End),imperial_trans_antarctic_expedition(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2011_afc_asian_cup_OR_imperial_trans_antarctic_expedition(Interval).

ev_2011_afc_asian_cup_OR_imperial_trans_antarctic_expedition_at_1916(Res) :- setof((Start,End),ev_2011_afc_asian_cup_OR_imperial_trans_antarctic_expedition(Start,End),AllINtervals), checkvalidity(1916,AllINtervals,Res).

check_query() :- write('Query = ev_2011_afc_asian_cup_OR_imperial_trans_antarctic_expedition_at_1916'), (ev_2011_afc_asian_cup_OR_imperial_trans_antarctic_expedition_at_1916(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2011_afc_asian_cup_OR_imperial_trans_antarctic_expedition_aux().

