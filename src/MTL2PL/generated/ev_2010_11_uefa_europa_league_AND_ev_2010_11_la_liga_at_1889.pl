:- include('database.pl').
ev_2010_11_uefa_europa_league(Start,End) :- begin('ev_2010_11_uefa_europa_league',_,_,Start), end('ev_2010_11_uefa_europa_league',_,_,End), Start=<End.

ev_2010_11_la_liga(Start,End) :- begin('ev_2010_11_la_liga',_,_,Start), end('ev_2010_11_la_liga',_,_,End), Start=<End.

generate_facts_ev_2010_11_uefa_europa_league_AND_ev_2010_11_la_liga([]) :- assert(ev_2010_11_uefa_europa_league_AND_ev_2010_11_la_liga(-1,-1)).

generate_facts_ev_2010_11_uefa_europa_league_AND_ev_2010_11_la_liga([(Start,End) | Tail]) :- assert(ev_2010_11_uefa_europa_league_AND_ev_2010_11_la_liga(Start,End)), generate_facts_ev_2010_11_uefa_europa_league_AND_ev_2010_11_la_liga(Tail).

ev_2010_11_uefa_europa_league_AND_ev_2010_11_la_liga_aux() :- findall((Start,End),ev_2010_11_uefa_europa_league(Start,End),Interval1), findall((Start,End),ev_2010_11_la_liga(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2010_11_uefa_europa_league_AND_ev_2010_11_la_liga(Interval).

ev_2010_11_uefa_europa_league_AND_ev_2010_11_la_liga_at_1889(Res) :- setof((Start,End),ev_2010_11_uefa_europa_league_AND_ev_2010_11_la_liga(Start,End),AllINtervals), checkvalidity(1889,AllINtervals,Res).

check_query() :- write('Query = ev_2010_11_uefa_europa_league_AND_ev_2010_11_la_liga_at_1889'), (ev_2010_11_uefa_europa_league_AND_ev_2010_11_la_liga_at_1889(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2010_11_uefa_europa_league_AND_ev_2010_11_la_liga_aux().

