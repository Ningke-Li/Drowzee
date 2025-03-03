:- include('database.pl').
ev_2002_03_uefa_champions_league(Start,End) :- begin('ev_2002_03_uefa_champions_league',_,_,Start), end('ev_2002_03_uefa_champions_league',_,_,End), Start=<End.

occupation_of_czechoslovakia(Start,End) :- begin('occupation_of_czechoslovakia',_,_,Start), end('occupation_of_czechoslovakia',_,_,End), Start=<End.

generate_facts_ev_2002_03_uefa_champions_league_OR_occupation_of_czechoslovakia([]) :- assert(ev_2002_03_uefa_champions_league_OR_occupation_of_czechoslovakia(-1,-1)).

generate_facts_ev_2002_03_uefa_champions_league_OR_occupation_of_czechoslovakia([(Start,End) | Tail]) :- assert(ev_2002_03_uefa_champions_league_OR_occupation_of_czechoslovakia(Start,End)), generate_facts_ev_2002_03_uefa_champions_league_OR_occupation_of_czechoslovakia(Tail).

ev_2002_03_uefa_champions_league_OR_occupation_of_czechoslovakia_aux() :- findall((Start,End),ev_2002_03_uefa_champions_league(Start,End),Interval1), findall((Start,End),occupation_of_czechoslovakia(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2002_03_uefa_champions_league_OR_occupation_of_czechoslovakia(Interval).

ev_2002_03_uefa_champions_league_OR_occupation_of_czechoslovakia_at_1940(Res) :- setof((Start,End),ev_2002_03_uefa_champions_league_OR_occupation_of_czechoslovakia(Start,End),AllINtervals), checkvalidity(1940,AllINtervals,Res).

check_query() :- write('Query = ev_2002_03_uefa_champions_league_OR_occupation_of_czechoslovakia_at_1940'), (ev_2002_03_uefa_champions_league_OR_occupation_of_czechoslovakia_at_1940(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2002_03_uefa_champions_league_OR_occupation_of_czechoslovakia_aux().

