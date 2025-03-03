:- include('database.pl').
ev_2008_09_uefa_champions_league(Start,End) :- begin('ev_2008_09_uefa_champions_league',_,_,Start), end('ev_2008_09_uefa_champions_league',_,_,End), Start=<End.

total_drama_island(Start,End) :- begin('total_drama_island',_,_,Start), end('total_drama_island',_,_,End), Start=<End.

generate_facts_ev_2008_09_uefa_champions_league_AND_total_drama_island([]) :- assert(ev_2008_09_uefa_champions_league_AND_total_drama_island(-1,-1)).

generate_facts_ev_2008_09_uefa_champions_league_AND_total_drama_island([(Start,End) | Tail]) :- assert(ev_2008_09_uefa_champions_league_AND_total_drama_island(Start,End)), generate_facts_ev_2008_09_uefa_champions_league_AND_total_drama_island(Tail).

ev_2008_09_uefa_champions_league_AND_total_drama_island_aux() :- findall((Start,End),ev_2008_09_uefa_champions_league(Start,End),Interval1), findall((Start,End),total_drama_island(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2008_09_uefa_champions_league_AND_total_drama_island(Interval).

ev_2008_09_uefa_champions_league_AND_total_drama_island_at_1933(Res) :- setof((Start,End),ev_2008_09_uefa_champions_league_AND_total_drama_island(Start,End),AllINtervals), checkvalidity(1933,AllINtervals,Res).

check_query() :- write('Query = ev_2008_09_uefa_champions_league_AND_total_drama_island_at_1933'), (ev_2008_09_uefa_champions_league_AND_total_drama_island_at_1933(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2008_09_uefa_champions_league_AND_total_drama_island_aux().

