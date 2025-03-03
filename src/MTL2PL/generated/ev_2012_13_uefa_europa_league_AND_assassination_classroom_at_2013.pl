:- include('database.pl').
ev_2012_13_uefa_europa_league(Start,End) :- begin('ev_2012_13_uefa_europa_league',_,_,Start), end('ev_2012_13_uefa_europa_league',_,_,End), Start=<End.

assassination_classroom(Start,End) :- begin('assassination_classroom',_,_,Start), end('assassination_classroom',_,_,End), Start=<End.

generate_facts_ev_2012_13_uefa_europa_league_AND_assassination_classroom([]) :- assert(ev_2012_13_uefa_europa_league_AND_assassination_classroom(-1,-1)).

generate_facts_ev_2012_13_uefa_europa_league_AND_assassination_classroom([(Start,End) | Tail]) :- assert(ev_2012_13_uefa_europa_league_AND_assassination_classroom(Start,End)), generate_facts_ev_2012_13_uefa_europa_league_AND_assassination_classroom(Tail).

ev_2012_13_uefa_europa_league_AND_assassination_classroom_aux() :- findall((Start,End),ev_2012_13_uefa_europa_league(Start,End),Interval1), findall((Start,End),assassination_classroom(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2012_13_uefa_europa_league_AND_assassination_classroom(Interval).

ev_2012_13_uefa_europa_league_AND_assassination_classroom_at_2013(Res) :- setof((Start,End),ev_2012_13_uefa_europa_league_AND_assassination_classroom(Start,End),AllINtervals), checkvalidity(2013,AllINtervals,Res).

check_query() :- write('Query = ev_2012_13_uefa_europa_league_AND_assassination_classroom_at_2013'), (ev_2012_13_uefa_europa_league_AND_assassination_classroom_at_2013(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2012_13_uefa_europa_league_AND_assassination_classroom_aux().

