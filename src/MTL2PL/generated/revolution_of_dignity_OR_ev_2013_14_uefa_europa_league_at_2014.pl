:- include('database.pl').
revolution_of_dignity(Start,End) :- begin('revolution_of_dignity',_,_,Start), end('revolution_of_dignity',_,_,End), Start=<End.

ev_2013_14_uefa_europa_league(Start,End) :- begin('ev_2013_14_uefa_europa_league',_,_,Start), end('ev_2013_14_uefa_europa_league',_,_,End), Start=<End.

generate_facts_revolution_of_dignity_OR_ev_2013_14_uefa_europa_league([]) :- assert(revolution_of_dignity_OR_ev_2013_14_uefa_europa_league(-1,-1)).

generate_facts_revolution_of_dignity_OR_ev_2013_14_uefa_europa_league([(Start,End) | Tail]) :- assert(revolution_of_dignity_OR_ev_2013_14_uefa_europa_league(Start,End)), generate_facts_revolution_of_dignity_OR_ev_2013_14_uefa_europa_league(Tail).

revolution_of_dignity_OR_ev_2013_14_uefa_europa_league_aux() :- findall((Start,End),revolution_of_dignity(Start,End),Interval1), findall((Start,End),ev_2013_14_uefa_europa_league(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_revolution_of_dignity_OR_ev_2013_14_uefa_europa_league(Interval).

revolution_of_dignity_OR_ev_2013_14_uefa_europa_league_at_2014(Res) :- setof((Start,End),revolution_of_dignity_OR_ev_2013_14_uefa_europa_league(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = revolution_of_dignity_OR_ev_2013_14_uefa_europa_league_at_2014'), (revolution_of_dignity_OR_ev_2013_14_uefa_europa_league_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).
?- revolution_of_dignity_OR_ev_2013_14_uefa_europa_league_aux().

