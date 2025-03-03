:- include('database.pl').
harry_potter(Start,End) :- begin('harry_potter',_,_,Start), end('harry_potter',_,_,End), Start=<End.

ev_2002_asian_games(Start,End) :- begin('ev_2002_asian_games',_,_,Start), end('ev_2002_asian_games',_,_,End), Start=<End.

generate_facts_harry_potter_OR_ev_2002_asian_games([]) :- assert(harry_potter_OR_ev_2002_asian_games(-1,-1)).

generate_facts_harry_potter_OR_ev_2002_asian_games([(Start,End) | Tail]) :- assert(harry_potter_OR_ev_2002_asian_games(Start,End)), generate_facts_harry_potter_OR_ev_2002_asian_games(Tail).

harry_potter_OR_ev_2002_asian_games_aux() :- findall((Start,End),harry_potter(Start,End),Interval1), findall((Start,End),ev_2002_asian_games(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_harry_potter_OR_ev_2002_asian_games(Interval).

harry_potter_OR_ev_2002_asian_games_at_1980(Res) :- setof((Start,End),harry_potter_OR_ev_2002_asian_games(Start,End),AllINtervals), checkvalidity(1980,AllINtervals,Res).

check_query() :- write('Query = harry_potter_OR_ev_2002_asian_games_at_1980'), (harry_potter_OR_ev_2002_asian_games_at_1980(true) -> write('\nRes   = true');write('\nRes   = false')).
?- harry_potter_OR_ev_2002_asian_games_aux().

