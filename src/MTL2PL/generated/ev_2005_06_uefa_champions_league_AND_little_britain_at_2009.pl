:- include('database.pl').
ev_2005_06_uefa_champions_league(Start,End) :- begin('ev_2005_06_uefa_champions_league',_,_,Start), end('ev_2005_06_uefa_champions_league',_,_,End), Start=<End.

little_britain(Start,End) :- begin('little_britain',_,_,Start), end('little_britain',_,_,End), Start=<End.

generate_facts_ev_2005_06_uefa_champions_league_AND_little_britain([]) :- assert(ev_2005_06_uefa_champions_league_AND_little_britain(-1,-1)).

generate_facts_ev_2005_06_uefa_champions_league_AND_little_britain([(Start,End) | Tail]) :- assert(ev_2005_06_uefa_champions_league_AND_little_britain(Start,End)), generate_facts_ev_2005_06_uefa_champions_league_AND_little_britain(Tail).

ev_2005_06_uefa_champions_league_AND_little_britain_aux() :- findall((Start,End),ev_2005_06_uefa_champions_league(Start,End),Interval1), findall((Start,End),little_britain(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2005_06_uefa_champions_league_AND_little_britain(Interval).

ev_2005_06_uefa_champions_league_AND_little_britain_at_2009(Res) :- setof((Start,End),ev_2005_06_uefa_champions_league_AND_little_britain(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = ev_2005_06_uefa_champions_league_AND_little_britain_at_2009'), (ev_2005_06_uefa_champions_league_AND_little_britain_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2005_06_uefa_champions_league_AND_little_britain_aux().

