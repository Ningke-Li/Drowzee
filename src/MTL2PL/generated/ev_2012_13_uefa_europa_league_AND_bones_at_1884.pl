:- include('database.pl').
ev_2012_13_uefa_europa_league(Start,End) :- begin('ev_2012_13_uefa_europa_league',_,_,Start), end('ev_2012_13_uefa_europa_league',_,_,End), Start=<End.

bones(Start,End) :- begin('bones',_,_,Start), end('bones',_,_,End), Start=<End.

generate_facts_ev_2012_13_uefa_europa_league_AND_bones([]) :- assert(ev_2012_13_uefa_europa_league_AND_bones(-1,-1)).

generate_facts_ev_2012_13_uefa_europa_league_AND_bones([(Start,End) | Tail]) :- assert(ev_2012_13_uefa_europa_league_AND_bones(Start,End)), generate_facts_ev_2012_13_uefa_europa_league_AND_bones(Tail).

ev_2012_13_uefa_europa_league_AND_bones_aux() :- findall((Start,End),ev_2012_13_uefa_europa_league(Start,End),Interval1), findall((Start,End),bones(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2012_13_uefa_europa_league_AND_bones(Interval).

ev_2012_13_uefa_europa_league_AND_bones_at_1884(Res) :- setof((Start,End),ev_2012_13_uefa_europa_league_AND_bones(Start,End),AllINtervals), checkvalidity(1884,AllINtervals,Res).

check_query() :- write('Query = ev_2012_13_uefa_europa_league_AND_bones_at_1884'), (ev_2012_13_uefa_europa_league_AND_bones_at_1884(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2012_13_uefa_europa_league_AND_bones_aux().

