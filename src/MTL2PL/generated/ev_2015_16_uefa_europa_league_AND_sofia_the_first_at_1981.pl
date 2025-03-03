:- include('database.pl').
ev_2015_16_uefa_europa_league(Start,End) :- begin('ev_2015_16_uefa_europa_league',_,_,Start), end('ev_2015_16_uefa_europa_league',_,_,End), Start=<End.

sofia_the_first(Start,End) :- begin('sofia_the_first',_,_,Start), end('sofia_the_first',_,_,End), Start=<End.

generate_facts_ev_2015_16_uefa_europa_league_AND_sofia_the_first([]) :- assert(ev_2015_16_uefa_europa_league_AND_sofia_the_first(-1,-1)).

generate_facts_ev_2015_16_uefa_europa_league_AND_sofia_the_first([(Start,End) | Tail]) :- assert(ev_2015_16_uefa_europa_league_AND_sofia_the_first(Start,End)), generate_facts_ev_2015_16_uefa_europa_league_AND_sofia_the_first(Tail).

ev_2015_16_uefa_europa_league_AND_sofia_the_first_aux() :- findall((Start,End),ev_2015_16_uefa_europa_league(Start,End),Interval1), findall((Start,End),sofia_the_first(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2015_16_uefa_europa_league_AND_sofia_the_first(Interval).

ev_2015_16_uefa_europa_league_AND_sofia_the_first_at_1981(Res) :- setof((Start,End),ev_2015_16_uefa_europa_league_AND_sofia_the_first(Start,End),AllINtervals), checkvalidity(1981,AllINtervals,Res).

check_query() :- write('Query = ev_2015_16_uefa_europa_league_AND_sofia_the_first_at_1981'), (ev_2015_16_uefa_europa_league_AND_sofia_the_first_at_1981(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2015_16_uefa_europa_league_AND_sofia_the_first_aux().

