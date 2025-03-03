:- include('database.pl').
glee(Start,End) :- begin('glee',_,_,Start), end('glee',_,_,End), Start=<End.

ev_2011_12_uefa_europa_league(Start,End) :- begin('ev_2011_12_uefa_europa_league',_,_,Start), end('ev_2011_12_uefa_europa_league',_,_,End), Start=<End.

generate_facts_glee_AND_ev_2011_12_uefa_europa_league([]) :- assert(glee_AND_ev_2011_12_uefa_europa_league(-1,-1)).

generate_facts_glee_AND_ev_2011_12_uefa_europa_league([(Start,End) | Tail]) :- assert(glee_AND_ev_2011_12_uefa_europa_league(Start,End)), generate_facts_glee_AND_ev_2011_12_uefa_europa_league(Tail).

glee_AND_ev_2011_12_uefa_europa_league_aux() :- findall((Start,End),glee(Start,End),Interval1), findall((Start,End),ev_2011_12_uefa_europa_league(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_glee_AND_ev_2011_12_uefa_europa_league(Interval).

glee_AND_ev_2011_12_uefa_europa_league_at_2012(Res) :- setof((Start,End),glee_AND_ev_2011_12_uefa_europa_league(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = glee_AND_ev_2011_12_uefa_europa_league_at_2012'), (glee_AND_ev_2011_12_uefa_europa_league_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).
?- glee_AND_ev_2011_12_uefa_europa_league_aux().

