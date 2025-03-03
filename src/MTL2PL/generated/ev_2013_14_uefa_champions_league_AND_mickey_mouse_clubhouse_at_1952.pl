:- include('database.pl').
ev_2013_14_uefa_champions_league(Start,End) :- begin('ev_2013_14_uefa_champions_league',_,_,Start), end('ev_2013_14_uefa_champions_league',_,_,End), Start=<End.

mickey_mouse_clubhouse(Start,End) :- begin('mickey_mouse_clubhouse',_,_,Start), end('mickey_mouse_clubhouse',_,_,End), Start=<End.

generate_facts_ev_2013_14_uefa_champions_league_AND_mickey_mouse_clubhouse([]) :- assert(ev_2013_14_uefa_champions_league_AND_mickey_mouse_clubhouse(-1,-1)).

generate_facts_ev_2013_14_uefa_champions_league_AND_mickey_mouse_clubhouse([(Start,End) | Tail]) :- assert(ev_2013_14_uefa_champions_league_AND_mickey_mouse_clubhouse(Start,End)), generate_facts_ev_2013_14_uefa_champions_league_AND_mickey_mouse_clubhouse(Tail).

ev_2013_14_uefa_champions_league_AND_mickey_mouse_clubhouse_aux() :- findall((Start,End),ev_2013_14_uefa_champions_league(Start,End),Interval1), findall((Start,End),mickey_mouse_clubhouse(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2013_14_uefa_champions_league_AND_mickey_mouse_clubhouse(Interval).

ev_2013_14_uefa_champions_league_AND_mickey_mouse_clubhouse_at_1952(Res) :- setof((Start,End),ev_2013_14_uefa_champions_league_AND_mickey_mouse_clubhouse(Start,End),AllINtervals), checkvalidity(1952,AllINtervals,Res).

check_query() :- write('Query = ev_2013_14_uefa_champions_league_AND_mickey_mouse_clubhouse_at_1952'), (ev_2013_14_uefa_champions_league_AND_mickey_mouse_clubhouse_at_1952(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2013_14_uefa_champions_league_AND_mickey_mouse_clubhouse_aux().

