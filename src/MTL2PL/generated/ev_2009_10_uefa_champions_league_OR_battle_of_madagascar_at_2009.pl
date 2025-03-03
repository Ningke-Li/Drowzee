:- include('database.pl').
ev_2009_10_uefa_champions_league(Start,End) :- begin('ev_2009_10_uefa_champions_league',_,_,Start), end('ev_2009_10_uefa_champions_league',_,_,End), Start=<End.

battle_of_madagascar(Start,End) :- begin('battle_of_madagascar',_,_,Start), end('battle_of_madagascar',_,_,End), Start=<End.

generate_facts_ev_2009_10_uefa_champions_league_OR_battle_of_madagascar([]) :- assert(ev_2009_10_uefa_champions_league_OR_battle_of_madagascar(-1,-1)).

generate_facts_ev_2009_10_uefa_champions_league_OR_battle_of_madagascar([(Start,End) | Tail]) :- assert(ev_2009_10_uefa_champions_league_OR_battle_of_madagascar(Start,End)), generate_facts_ev_2009_10_uefa_champions_league_OR_battle_of_madagascar(Tail).

ev_2009_10_uefa_champions_league_OR_battle_of_madagascar_aux() :- findall((Start,End),ev_2009_10_uefa_champions_league(Start,End),Interval1), findall((Start,End),battle_of_madagascar(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2009_10_uefa_champions_league_OR_battle_of_madagascar(Interval).

ev_2009_10_uefa_champions_league_OR_battle_of_madagascar_at_2009(Res) :- setof((Start,End),ev_2009_10_uefa_champions_league_OR_battle_of_madagascar(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = ev_2009_10_uefa_champions_league_OR_battle_of_madagascar_at_2009'), (ev_2009_10_uefa_champions_league_OR_battle_of_madagascar_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2009_10_uefa_champions_league_OR_battle_of_madagascar_aux().

