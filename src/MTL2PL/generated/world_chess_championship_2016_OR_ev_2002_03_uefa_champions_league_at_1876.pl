:- include('database.pl').
world_chess_championship_2016(Start,End) :- begin('world_chess_championship_2016',_,_,Start), end('world_chess_championship_2016',_,_,End), Start=<End.

ev_2002_03_uefa_champions_league(Start,End) :- begin('ev_2002_03_uefa_champions_league',_,_,Start), end('ev_2002_03_uefa_champions_league',_,_,End), Start=<End.

generate_facts_world_chess_championship_2016_OR_ev_2002_03_uefa_champions_league([]) :- assert(world_chess_championship_2016_OR_ev_2002_03_uefa_champions_league(-1,-1)).

generate_facts_world_chess_championship_2016_OR_ev_2002_03_uefa_champions_league([(Start,End) | Tail]) :- assert(world_chess_championship_2016_OR_ev_2002_03_uefa_champions_league(Start,End)), generate_facts_world_chess_championship_2016_OR_ev_2002_03_uefa_champions_league(Tail).

world_chess_championship_2016_OR_ev_2002_03_uefa_champions_league_aux() :- findall((Start,End),world_chess_championship_2016(Start,End),Interval1), findall((Start,End),ev_2002_03_uefa_champions_league(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_world_chess_championship_2016_OR_ev_2002_03_uefa_champions_league(Interval).

world_chess_championship_2016_OR_ev_2002_03_uefa_champions_league_at_1876(Res) :- setof((Start,End),world_chess_championship_2016_OR_ev_2002_03_uefa_champions_league(Start,End),AllINtervals), checkvalidity(1876,AllINtervals,Res).

check_query() :- write('Query = world_chess_championship_2016_OR_ev_2002_03_uefa_champions_league_at_1876'), (world_chess_championship_2016_OR_ev_2002_03_uefa_champions_league_at_1876(true) -> write('\nRes   = true');write('\nRes   = false')).
?- world_chess_championship_2016_OR_ev_2002_03_uefa_champions_league_aux().

