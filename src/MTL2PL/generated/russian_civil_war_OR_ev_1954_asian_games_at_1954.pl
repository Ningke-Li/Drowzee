:- include('database.pl').
russian_civil_war(Start,End) :- begin('russian_civil_war',_,_,Start), end('russian_civil_war',_,_,End), Start=<End.

ev_1954_asian_games(Start,End) :- begin('ev_1954_asian_games',_,_,Start), end('ev_1954_asian_games',_,_,End), Start=<End.

generate_facts_russian_civil_war_OR_ev_1954_asian_games([]) :- assert(russian_civil_war_OR_ev_1954_asian_games(-1,-1)).

generate_facts_russian_civil_war_OR_ev_1954_asian_games([(Start,End) | Tail]) :- assert(russian_civil_war_OR_ev_1954_asian_games(Start,End)), generate_facts_russian_civil_war_OR_ev_1954_asian_games(Tail).

russian_civil_war_OR_ev_1954_asian_games_aux() :- findall((Start,End),russian_civil_war(Start,End),Interval1), findall((Start,End),ev_1954_asian_games(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_russian_civil_war_OR_ev_1954_asian_games(Interval).

russian_civil_war_OR_ev_1954_asian_games_at_1954(Res) :- setof((Start,End),russian_civil_war_OR_ev_1954_asian_games(Start,End),AllINtervals), checkvalidity(1954,AllINtervals,Res).

check_query() :- write('Query = russian_civil_war_OR_ev_1954_asian_games_at_1954'), (russian_civil_war_OR_ev_1954_asian_games_at_1954(true) -> write('\nRes   = true');write('\nRes   = false')).
?- russian_civil_war_OR_ev_1954_asian_games_aux().

