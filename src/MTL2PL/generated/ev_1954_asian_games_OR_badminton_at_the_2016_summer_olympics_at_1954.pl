:- include('database.pl').
ev_1954_asian_games(Start,End) :- begin('ev_1954_asian_games',_,_,Start), end('ev_1954_asian_games',_,_,End), Start=<End.

badminton_at_the_2016_summer_olympics(Start,End) :- begin('badminton_at_the_2016_summer_olympics',_,_,Start), end('badminton_at_the_2016_summer_olympics',_,_,End), Start=<End.

generate_facts_ev_1954_asian_games_OR_badminton_at_the_2016_summer_olympics([]) :- assert(ev_1954_asian_games_OR_badminton_at_the_2016_summer_olympics(-1,-1)).

generate_facts_ev_1954_asian_games_OR_badminton_at_the_2016_summer_olympics([(Start,End) | Tail]) :- assert(ev_1954_asian_games_OR_badminton_at_the_2016_summer_olympics(Start,End)), generate_facts_ev_1954_asian_games_OR_badminton_at_the_2016_summer_olympics(Tail).

ev_1954_asian_games_OR_badminton_at_the_2016_summer_olympics_aux() :- findall((Start,End),ev_1954_asian_games(Start,End),Interval1), findall((Start,End),badminton_at_the_2016_summer_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_1954_asian_games_OR_badminton_at_the_2016_summer_olympics(Interval).

ev_1954_asian_games_OR_badminton_at_the_2016_summer_olympics_at_1954(Res) :- setof((Start,End),ev_1954_asian_games_OR_badminton_at_the_2016_summer_olympics(Start,End),AllINtervals), checkvalidity(1954,AllINtervals,Res).

check_query() :- write('Query = ev_1954_asian_games_OR_badminton_at_the_2016_summer_olympics_at_1954'), (ev_1954_asian_games_OR_badminton_at_the_2016_summer_olympics_at_1954(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_1954_asian_games_OR_badminton_at_the_2016_summer_olympics_aux().

