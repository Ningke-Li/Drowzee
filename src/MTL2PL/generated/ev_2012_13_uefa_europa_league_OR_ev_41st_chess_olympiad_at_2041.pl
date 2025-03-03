:- include('database.pl').
ev_2012_13_uefa_europa_league(Start,End) :- begin('ev_2012_13_uefa_europa_league',_,_,Start), end('ev_2012_13_uefa_europa_league',_,_,End), Start=<End.

ev_41st_chess_olympiad(Start,End) :- begin('ev_41st_chess_olympiad',_,_,Start), end('ev_41st_chess_olympiad',_,_,End), Start=<End.

generate_facts_ev_2012_13_uefa_europa_league_OR_ev_41st_chess_olympiad([]) :- assert(ev_2012_13_uefa_europa_league_OR_ev_41st_chess_olympiad(-1,-1)).

generate_facts_ev_2012_13_uefa_europa_league_OR_ev_41st_chess_olympiad([(Start,End) | Tail]) :- assert(ev_2012_13_uefa_europa_league_OR_ev_41st_chess_olympiad(Start,End)), generate_facts_ev_2012_13_uefa_europa_league_OR_ev_41st_chess_olympiad(Tail).

ev_2012_13_uefa_europa_league_OR_ev_41st_chess_olympiad_aux() :- findall((Start,End),ev_2012_13_uefa_europa_league(Start,End),Interval1), findall((Start,End),ev_41st_chess_olympiad(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2012_13_uefa_europa_league_OR_ev_41st_chess_olympiad(Interval).

ev_2012_13_uefa_europa_league_OR_ev_41st_chess_olympiad_at_2041(Res) :- setof((Start,End),ev_2012_13_uefa_europa_league_OR_ev_41st_chess_olympiad(Start,End),AllINtervals), checkvalidity(2041,AllINtervals,Res).

check_query() :- write('Query = ev_2012_13_uefa_europa_league_OR_ev_41st_chess_olympiad_at_2041'), (ev_2012_13_uefa_europa_league_OR_ev_41st_chess_olympiad_at_2041(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2012_13_uefa_europa_league_OR_ev_41st_chess_olympiad_aux().

