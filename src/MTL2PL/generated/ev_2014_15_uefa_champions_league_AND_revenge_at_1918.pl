:- include('database.pl').
ev_2014_15_uefa_champions_league(Start,End) :- begin('ev_2014_15_uefa_champions_league',_,_,Start), end('ev_2014_15_uefa_champions_league',_,_,End), Start=<End.

revenge(Start,End) :- begin('revenge',_,_,Start), end('revenge',_,_,End), Start=<End.

generate_facts_ev_2014_15_uefa_champions_league_AND_revenge([]) :- assert(ev_2014_15_uefa_champions_league_AND_revenge(-1,-1)).

generate_facts_ev_2014_15_uefa_champions_league_AND_revenge([(Start,End) | Tail]) :- assert(ev_2014_15_uefa_champions_league_AND_revenge(Start,End)), generate_facts_ev_2014_15_uefa_champions_league_AND_revenge(Tail).

ev_2014_15_uefa_champions_league_AND_revenge_aux() :- findall((Start,End),ev_2014_15_uefa_champions_league(Start,End),Interval1), findall((Start,End),revenge(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2014_15_uefa_champions_league_AND_revenge(Interval).

ev_2014_15_uefa_champions_league_AND_revenge_at_1918(Res) :- setof((Start,End),ev_2014_15_uefa_champions_league_AND_revenge(Start,End),AllINtervals), checkvalidity(1918,AllINtervals,Res).

check_query() :- write('Query = ev_2014_15_uefa_champions_league_AND_revenge_at_1918'), (ev_2014_15_uefa_champions_league_AND_revenge_at_1918(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2014_15_uefa_champions_league_AND_revenge_aux().

