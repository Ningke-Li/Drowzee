:- include('database.pl').
ev_2017_spanish_grand_prix(Start,End) :- begin('ev_2017_spanish_grand_prix',_,_,Start), end('ev_2017_spanish_grand_prix',_,_,End), Start=<End.

ev_2002_asian_games(Start,End) :- begin('ev_2002_asian_games',_,_,Start), end('ev_2002_asian_games',_,_,End), Start=<End.

generate_facts_ev_2017_spanish_grand_prix_OR_ev_2002_asian_games([]) :- assert(ev_2017_spanish_grand_prix_OR_ev_2002_asian_games(-1,-1)).

generate_facts_ev_2017_spanish_grand_prix_OR_ev_2002_asian_games([(Start,End) | Tail]) :- assert(ev_2017_spanish_grand_prix_OR_ev_2002_asian_games(Start,End)), generate_facts_ev_2017_spanish_grand_prix_OR_ev_2002_asian_games(Tail).

ev_2017_spanish_grand_prix_OR_ev_2002_asian_games_aux() :- findall((Start,End),ev_2017_spanish_grand_prix(Start,End),Interval1), findall((Start,End),ev_2002_asian_games(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2017_spanish_grand_prix_OR_ev_2002_asian_games(Interval).

ev_2017_spanish_grand_prix_OR_ev_2002_asian_games_at_2017(Res) :- setof((Start,End),ev_2017_spanish_grand_prix_OR_ev_2002_asian_games(Start,End),AllINtervals), checkvalidity(2017,AllINtervals,Res).

check_query() :- write('Query = ev_2017_spanish_grand_prix_OR_ev_2002_asian_games_at_2017'), (ev_2017_spanish_grand_prix_OR_ev_2002_asian_games_at_2017(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2017_spanish_grand_prix_OR_ev_2002_asian_games_aux().

