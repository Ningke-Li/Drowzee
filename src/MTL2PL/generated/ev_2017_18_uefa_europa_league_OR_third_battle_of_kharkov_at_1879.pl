:- include('database.pl').
ev_2017_18_uefa_europa_league(Start,End) :- begin('ev_2017_18_uefa_europa_league',_,_,Start), end('ev_2017_18_uefa_europa_league',_,_,End), Start=<End.

third_battle_of_kharkov(Start,End) :- begin('third_battle_of_kharkov',_,_,Start), end('third_battle_of_kharkov',_,_,End), Start=<End.

generate_facts_ev_2017_18_uefa_europa_league_OR_third_battle_of_kharkov([]) :- assert(ev_2017_18_uefa_europa_league_OR_third_battle_of_kharkov(-1,-1)).

generate_facts_ev_2017_18_uefa_europa_league_OR_third_battle_of_kharkov([(Start,End) | Tail]) :- assert(ev_2017_18_uefa_europa_league_OR_third_battle_of_kharkov(Start,End)), generate_facts_ev_2017_18_uefa_europa_league_OR_third_battle_of_kharkov(Tail).

ev_2017_18_uefa_europa_league_OR_third_battle_of_kharkov_aux() :- findall((Start,End),ev_2017_18_uefa_europa_league(Start,End),Interval1), findall((Start,End),third_battle_of_kharkov(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2017_18_uefa_europa_league_OR_third_battle_of_kharkov(Interval).

ev_2017_18_uefa_europa_league_OR_third_battle_of_kharkov_at_1879(Res) :- setof((Start,End),ev_2017_18_uefa_europa_league_OR_third_battle_of_kharkov(Start,End),AllINtervals), checkvalidity(1879,AllINtervals,Res).

check_query() :- write('Query = ev_2017_18_uefa_europa_league_OR_third_battle_of_kharkov_at_1879'), (ev_2017_18_uefa_europa_league_OR_third_battle_of_kharkov_at_1879(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2017_18_uefa_europa_league_OR_third_battle_of_kharkov_aux().

