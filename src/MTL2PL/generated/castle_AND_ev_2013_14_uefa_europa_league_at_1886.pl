:- include('database.pl').
castle(Start,End) :- begin('castle',_,_,Start), end('castle',_,_,End), Start=<End.

ev_2013_14_uefa_europa_league(Start,End) :- begin('ev_2013_14_uefa_europa_league',_,_,Start), end('ev_2013_14_uefa_europa_league',_,_,End), Start=<End.

generate_facts_castle_AND_ev_2013_14_uefa_europa_league([]) :- assert(castle_AND_ev_2013_14_uefa_europa_league(-1,-1)).

generate_facts_castle_AND_ev_2013_14_uefa_europa_league([(Start,End) | Tail]) :- assert(castle_AND_ev_2013_14_uefa_europa_league(Start,End)), generate_facts_castle_AND_ev_2013_14_uefa_europa_league(Tail).

castle_AND_ev_2013_14_uefa_europa_league_aux() :- findall((Start,End),castle(Start,End),Interval1), findall((Start,End),ev_2013_14_uefa_europa_league(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_castle_AND_ev_2013_14_uefa_europa_league(Interval).

castle_AND_ev_2013_14_uefa_europa_league_at_1886(Res) :- setof((Start,End),castle_AND_ev_2013_14_uefa_europa_league(Start,End),AllINtervals), checkvalidity(1886,AllINtervals,Res).

check_query() :- write('Query = castle_AND_ev_2013_14_uefa_europa_league_at_1886'), (castle_AND_ev_2013_14_uefa_europa_league_at_1886(true) -> write('\nRes   = true');write('\nRes   = false')).
?- castle_AND_ev_2013_14_uefa_europa_league_aux().

