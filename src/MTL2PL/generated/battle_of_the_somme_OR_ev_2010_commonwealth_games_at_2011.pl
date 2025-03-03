:- include('database.pl').
battle_of_the_somme(Start,End) :- begin('battle_of_the_somme',_,_,Start), end('battle_of_the_somme',_,_,End), Start=<End.

ev_2010_commonwealth_games(Start,End) :- begin('ev_2010_commonwealth_games',_,_,Start), end('ev_2010_commonwealth_games',_,_,End), Start=<End.

generate_facts_battle_of_the_somme_OR_ev_2010_commonwealth_games([]) :- assert(battle_of_the_somme_OR_ev_2010_commonwealth_games(-1,-1)).

generate_facts_battle_of_the_somme_OR_ev_2010_commonwealth_games([(Start,End) | Tail]) :- assert(battle_of_the_somme_OR_ev_2010_commonwealth_games(Start,End)), generate_facts_battle_of_the_somme_OR_ev_2010_commonwealth_games(Tail).

battle_of_the_somme_OR_ev_2010_commonwealth_games_aux() :- findall((Start,End),battle_of_the_somme(Start,End),Interval1), findall((Start,End),ev_2010_commonwealth_games(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_battle_of_the_somme_OR_ev_2010_commonwealth_games(Interval).

battle_of_the_somme_OR_ev_2010_commonwealth_games_at_2011(Res) :- setof((Start,End),battle_of_the_somme_OR_ev_2010_commonwealth_games(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = battle_of_the_somme_OR_ev_2010_commonwealth_games_at_2011'), (battle_of_the_somme_OR_ev_2010_commonwealth_games_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).
?- battle_of_the_somme_OR_ev_2010_commonwealth_games_aux().

