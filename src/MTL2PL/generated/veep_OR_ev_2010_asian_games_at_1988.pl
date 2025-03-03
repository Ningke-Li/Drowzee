:- include('database.pl').
veep(Start,End) :- begin('veep',_,_,Start), end('veep',_,_,End), Start=<End.

ev_2010_asian_games(Start,End) :- begin('ev_2010_asian_games',_,_,Start), end('ev_2010_asian_games',_,_,End), Start=<End.

generate_facts_veep_OR_ev_2010_asian_games([]) :- assert(veep_OR_ev_2010_asian_games(-1,-1)).

generate_facts_veep_OR_ev_2010_asian_games([(Start,End) | Tail]) :- assert(veep_OR_ev_2010_asian_games(Start,End)), generate_facts_veep_OR_ev_2010_asian_games(Tail).

veep_OR_ev_2010_asian_games_aux() :- findall((Start,End),veep(Start,End),Interval1), findall((Start,End),ev_2010_asian_games(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_veep_OR_ev_2010_asian_games(Interval).

veep_OR_ev_2010_asian_games_at_1988(Res) :- setof((Start,End),veep_OR_ev_2010_asian_games(Start,End),AllINtervals), checkvalidity(1988,AllINtervals,Res).

check_query() :- write('Query = veep_OR_ev_2010_asian_games_at_1988'), (veep_OR_ev_2010_asian_games_at_1988(true) -> write('\nRes   = true');write('\nRes   = false')).
?- veep_OR_ev_2010_asian_games_aux().

