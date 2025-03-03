:- include('database.pl').
ev_2014_commonwealth_games(Start,End) :- begin('ev_2014_commonwealth_games',_,_,Start), end('ev_2014_commonwealth_games',_,_,End), Start=<End.

nikita(Start,End) :- begin('nikita',_,_,Start), end('nikita',_,_,End), Start=<End.

generate_facts_ev_2014_commonwealth_games_OR_nikita([]) :- assert(ev_2014_commonwealth_games_OR_nikita(-1,-1)).

generate_facts_ev_2014_commonwealth_games_OR_nikita([(Start,End) | Tail]) :- assert(ev_2014_commonwealth_games_OR_nikita(Start,End)), generate_facts_ev_2014_commonwealth_games_OR_nikita(Tail).

ev_2014_commonwealth_games_OR_nikita_aux() :- findall((Start,End),ev_2014_commonwealth_games(Start,End),Interval1), findall((Start,End),nikita(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2014_commonwealth_games_OR_nikita(Interval).

ev_2014_commonwealth_games_OR_nikita_at_2013(Res) :- setof((Start,End),ev_2014_commonwealth_games_OR_nikita(Start,End),AllINtervals), checkvalidity(2013,AllINtervals,Res).

check_query() :- write('Query = ev_2014_commonwealth_games_OR_nikita_at_2013'), (ev_2014_commonwealth_games_OR_nikita_at_2013(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2014_commonwealth_games_OR_nikita_aux().

