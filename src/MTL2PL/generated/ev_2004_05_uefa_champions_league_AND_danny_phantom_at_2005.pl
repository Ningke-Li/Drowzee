:- include('database.pl').
ev_2004_05_uefa_champions_league(Start,End) :- begin('ev_2004_05_uefa_champions_league',_,_,Start), end('ev_2004_05_uefa_champions_league',_,_,End), Start=<End.

danny_phantom(Start,End) :- begin('danny_phantom',_,_,Start), end('danny_phantom',_,_,End), Start=<End.

generate_facts_ev_2004_05_uefa_champions_league_AND_danny_phantom([]) :- assert(ev_2004_05_uefa_champions_league_AND_danny_phantom(-1,-1)).

generate_facts_ev_2004_05_uefa_champions_league_AND_danny_phantom([(Start,End) | Tail]) :- assert(ev_2004_05_uefa_champions_league_AND_danny_phantom(Start,End)), generate_facts_ev_2004_05_uefa_champions_league_AND_danny_phantom(Tail).

ev_2004_05_uefa_champions_league_AND_danny_phantom_aux() :- findall((Start,End),ev_2004_05_uefa_champions_league(Start,End),Interval1), findall((Start,End),danny_phantom(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2004_05_uefa_champions_league_AND_danny_phantom(Interval).

ev_2004_05_uefa_champions_league_AND_danny_phantom_at_2005(Res) :- setof((Start,End),ev_2004_05_uefa_champions_league_AND_danny_phantom(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = ev_2004_05_uefa_champions_league_AND_danny_phantom_at_2005'), (ev_2004_05_uefa_champions_league_AND_danny_phantom_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2004_05_uefa_champions_league_AND_danny_phantom_aux().

