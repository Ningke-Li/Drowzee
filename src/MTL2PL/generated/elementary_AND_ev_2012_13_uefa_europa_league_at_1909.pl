:- include('database.pl').
elementary(Start,End) :- begin('elementary',_,_,Start), end('elementary',_,_,End), Start=<End.

ev_2012_13_uefa_europa_league(Start,End) :- begin('ev_2012_13_uefa_europa_league',_,_,Start), end('ev_2012_13_uefa_europa_league',_,_,End), Start=<End.

generate_facts_elementary_AND_ev_2012_13_uefa_europa_league([]) :- assert(elementary_AND_ev_2012_13_uefa_europa_league(-1,-1)).

generate_facts_elementary_AND_ev_2012_13_uefa_europa_league([(Start,End) | Tail]) :- assert(elementary_AND_ev_2012_13_uefa_europa_league(Start,End)), generate_facts_elementary_AND_ev_2012_13_uefa_europa_league(Tail).

elementary_AND_ev_2012_13_uefa_europa_league_aux() :- findall((Start,End),elementary(Start,End),Interval1), findall((Start,End),ev_2012_13_uefa_europa_league(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_elementary_AND_ev_2012_13_uefa_europa_league(Interval).

elementary_AND_ev_2012_13_uefa_europa_league_at_1909(Res) :- setof((Start,End),elementary_AND_ev_2012_13_uefa_europa_league(Start,End),AllINtervals), checkvalidity(1909,AllINtervals,Res).

check_query() :- write('Query = elementary_AND_ev_2012_13_uefa_europa_league_at_1909'), (elementary_AND_ev_2012_13_uefa_europa_league_at_1909(true) -> write('\nRes   = true');write('\nRes   = false')).
?- elementary_AND_ev_2012_13_uefa_europa_league_aux().

