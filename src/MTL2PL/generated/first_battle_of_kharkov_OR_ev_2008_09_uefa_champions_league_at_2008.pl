:- include('database.pl').
first_battle_of_kharkov(Start,End) :- begin('first_battle_of_kharkov',_,_,Start), end('first_battle_of_kharkov',_,_,End), Start=<End.

ev_2008_09_uefa_champions_league(Start,End) :- begin('ev_2008_09_uefa_champions_league',_,_,Start), end('ev_2008_09_uefa_champions_league',_,_,End), Start=<End.

generate_facts_first_battle_of_kharkov_OR_ev_2008_09_uefa_champions_league([]) :- assert(first_battle_of_kharkov_OR_ev_2008_09_uefa_champions_league(-1,-1)).

generate_facts_first_battle_of_kharkov_OR_ev_2008_09_uefa_champions_league([(Start,End) | Tail]) :- assert(first_battle_of_kharkov_OR_ev_2008_09_uefa_champions_league(Start,End)), generate_facts_first_battle_of_kharkov_OR_ev_2008_09_uefa_champions_league(Tail).

first_battle_of_kharkov_OR_ev_2008_09_uefa_champions_league_aux() :- findall((Start,End),first_battle_of_kharkov(Start,End),Interval1), findall((Start,End),ev_2008_09_uefa_champions_league(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_first_battle_of_kharkov_OR_ev_2008_09_uefa_champions_league(Interval).

first_battle_of_kharkov_OR_ev_2008_09_uefa_champions_league_at_2008(Res) :- setof((Start,End),first_battle_of_kharkov_OR_ev_2008_09_uefa_champions_league(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = first_battle_of_kharkov_OR_ev_2008_09_uefa_champions_league_at_2008'), (first_battle_of_kharkov_OR_ev_2008_09_uefa_champions_league_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).
?- first_battle_of_kharkov_OR_ev_2008_09_uefa_champions_league_aux().

