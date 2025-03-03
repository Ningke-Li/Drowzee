:- include('database.pl').
ev_2011_afc_asian_cup(Start,End) :- begin('ev_2011_afc_asian_cup',_,_,Start), end('ev_2011_afc_asian_cup',_,_,End), Start=<End.

second_northern_war(Start,End) :- begin('second_northern_war',_,_,Start), end('second_northern_war',_,_,End), Start=<End.

generate_facts_ev_2011_afc_asian_cup_OR_second_northern_war([]) :- assert(ev_2011_afc_asian_cup_OR_second_northern_war(-1,-1)).

generate_facts_ev_2011_afc_asian_cup_OR_second_northern_war([(Start,End) | Tail]) :- assert(ev_2011_afc_asian_cup_OR_second_northern_war(Start,End)), generate_facts_ev_2011_afc_asian_cup_OR_second_northern_war(Tail).

ev_2011_afc_asian_cup_OR_second_northern_war_aux() :- findall((Start,End),ev_2011_afc_asian_cup(Start,End),Interval1), findall((Start,End),second_northern_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2011_afc_asian_cup_OR_second_northern_war(Interval).

ev_2011_afc_asian_cup_OR_second_northern_war_at_1656(Res) :- setof((Start,End),ev_2011_afc_asian_cup_OR_second_northern_war(Start,End),AllINtervals), checkvalidity(1656,AllINtervals,Res).

check_query() :- write('Query = ev_2011_afc_asian_cup_OR_second_northern_war_at_1656'), (ev_2011_afc_asian_cup_OR_second_northern_war_at_1656(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2011_afc_asian_cup_OR_second_northern_war_aux().

