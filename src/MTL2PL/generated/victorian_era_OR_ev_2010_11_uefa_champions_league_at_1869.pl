:- include('database.pl').
victorian_era(Start,End) :- begin('victorian_era',_,_,Start), end('victorian_era',_,_,End), Start=<End.

ev_2010_11_uefa_champions_league(Start,End) :- begin('ev_2010_11_uefa_champions_league',_,_,Start), end('ev_2010_11_uefa_champions_league',_,_,End), Start=<End.

generate_facts_victorian_era_OR_ev_2010_11_uefa_champions_league([]) :- assert(victorian_era_OR_ev_2010_11_uefa_champions_league(-1,-1)).

generate_facts_victorian_era_OR_ev_2010_11_uefa_champions_league([(Start,End) | Tail]) :- assert(victorian_era_OR_ev_2010_11_uefa_champions_league(Start,End)), generate_facts_victorian_era_OR_ev_2010_11_uefa_champions_league(Tail).

victorian_era_OR_ev_2010_11_uefa_champions_league_aux() :- findall((Start,End),victorian_era(Start,End),Interval1), findall((Start,End),ev_2010_11_uefa_champions_league(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_victorian_era_OR_ev_2010_11_uefa_champions_league(Interval).

victorian_era_OR_ev_2010_11_uefa_champions_league_at_1869(Res) :- setof((Start,End),victorian_era_OR_ev_2010_11_uefa_champions_league(Start,End),AllINtervals), checkvalidity(1869,AllINtervals,Res).

check_query() :- write('Query = victorian_era_OR_ev_2010_11_uefa_champions_league_at_1869'), (victorian_era_OR_ev_2010_11_uefa_champions_league_at_1869(true) -> write('\nRes   = true');write('\nRes   = false')).
?- victorian_era_OR_ev_2010_11_uefa_champions_league_aux().

