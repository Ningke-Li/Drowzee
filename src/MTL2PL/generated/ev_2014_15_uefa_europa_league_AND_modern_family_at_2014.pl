:- include('database.pl').
ev_2014_15_uefa_europa_league(Start,End) :- begin('ev_2014_15_uefa_europa_league',_,_,Start), end('ev_2014_15_uefa_europa_league',_,_,End), Start=<End.

modern_family(Start,End) :- begin('modern_family',_,_,Start), end('modern_family',_,_,End), Start=<End.

generate_facts_ev_2014_15_uefa_europa_league_AND_modern_family([]) :- assert(ev_2014_15_uefa_europa_league_AND_modern_family(-1,-1)).

generate_facts_ev_2014_15_uefa_europa_league_AND_modern_family([(Start,End) | Tail]) :- assert(ev_2014_15_uefa_europa_league_AND_modern_family(Start,End)), generate_facts_ev_2014_15_uefa_europa_league_AND_modern_family(Tail).

ev_2014_15_uefa_europa_league_AND_modern_family_aux() :- findall((Start,End),ev_2014_15_uefa_europa_league(Start,End),Interval1), findall((Start,End),modern_family(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2014_15_uefa_europa_league_AND_modern_family(Interval).

ev_2014_15_uefa_europa_league_AND_modern_family_at_2014(Res) :- setof((Start,End),ev_2014_15_uefa_europa_league_AND_modern_family(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = ev_2014_15_uefa_europa_league_AND_modern_family_at_2014'), (ev_2014_15_uefa_europa_league_AND_modern_family_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2014_15_uefa_europa_league_AND_modern_family_aux().

