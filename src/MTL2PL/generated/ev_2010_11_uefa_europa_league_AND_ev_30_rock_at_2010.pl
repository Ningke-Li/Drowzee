:- include('database.pl').
ev_2010_11_uefa_europa_league(Start,End) :- begin('ev_2010_11_uefa_europa_league',_,_,Start), end('ev_2010_11_uefa_europa_league',_,_,End), Start=<End.

ev_30_rock(Start,End) :- begin('ev_30_rock',_,_,Start), end('ev_30_rock',_,_,End), Start=<End.

generate_facts_ev_2010_11_uefa_europa_league_AND_ev_30_rock([]) :- assert(ev_2010_11_uefa_europa_league_AND_ev_30_rock(-1,-1)).

generate_facts_ev_2010_11_uefa_europa_league_AND_ev_30_rock([(Start,End) | Tail]) :- assert(ev_2010_11_uefa_europa_league_AND_ev_30_rock(Start,End)), generate_facts_ev_2010_11_uefa_europa_league_AND_ev_30_rock(Tail).

ev_2010_11_uefa_europa_league_AND_ev_30_rock_aux() :- findall((Start,End),ev_2010_11_uefa_europa_league(Start,End),Interval1), findall((Start,End),ev_30_rock(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2010_11_uefa_europa_league_AND_ev_30_rock(Interval).

ev_2010_11_uefa_europa_league_AND_ev_30_rock_at_2010(Res) :- setof((Start,End),ev_2010_11_uefa_europa_league_AND_ev_30_rock(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = ev_2010_11_uefa_europa_league_AND_ev_30_rock_at_2010'), (ev_2010_11_uefa_europa_league_AND_ev_30_rock_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2010_11_uefa_europa_league_AND_ev_30_rock_aux().

