:- include('database.pl').
ev_2004_summer_olympics(Start,End) :- begin('ev_2004_summer_olympics',_,_,Start), end('ev_2004_summer_olympics',_,_,End), Start=<End.

ev_2009_10_uefa_europa_league(Start,End) :- begin('ev_2009_10_uefa_europa_league',_,_,Start), end('ev_2009_10_uefa_europa_league',_,_,End), Start=<End.

generate_facts_ev_2004_summer_olympics_OR_ev_2009_10_uefa_europa_league([]) :- assert(ev_2004_summer_olympics_OR_ev_2009_10_uefa_europa_league(-1,-1)).

generate_facts_ev_2004_summer_olympics_OR_ev_2009_10_uefa_europa_league([(Start,End) | Tail]) :- assert(ev_2004_summer_olympics_OR_ev_2009_10_uefa_europa_league(Start,End)), generate_facts_ev_2004_summer_olympics_OR_ev_2009_10_uefa_europa_league(Tail).

ev_2004_summer_olympics_OR_ev_2009_10_uefa_europa_league_aux() :- findall((Start,End),ev_2004_summer_olympics(Start,End),Interval1), findall((Start,End),ev_2009_10_uefa_europa_league(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2004_summer_olympics_OR_ev_2009_10_uefa_europa_league(Interval).

ev_2004_summer_olympics_OR_ev_2009_10_uefa_europa_league_at_1996(Res) :- setof((Start,End),ev_2004_summer_olympics_OR_ev_2009_10_uefa_europa_league(Start,End),AllINtervals), checkvalidity(1996,AllINtervals,Res).

check_query() :- write('Query = ev_2004_summer_olympics_OR_ev_2009_10_uefa_europa_league_at_1996'), (ev_2004_summer_olympics_OR_ev_2009_10_uefa_europa_league_at_1996(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2004_summer_olympics_OR_ev_2009_10_uefa_europa_league_aux().

