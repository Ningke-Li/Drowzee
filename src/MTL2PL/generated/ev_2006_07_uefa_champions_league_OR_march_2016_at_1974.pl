:- include('database.pl').
ev_2006_07_uefa_champions_league(Start,End) :- begin('ev_2006_07_uefa_champions_league',_,_,Start), end('ev_2006_07_uefa_champions_league',_,_,End), Start=<End.

march_2016(Start,End) :- begin('march_2016',_,_,Start), end('march_2016',_,_,End), Start=<End.

generate_facts_ev_2006_07_uefa_champions_league_OR_march_2016([]) :- assert(ev_2006_07_uefa_champions_league_OR_march_2016(-1,-1)).

generate_facts_ev_2006_07_uefa_champions_league_OR_march_2016([(Start,End) | Tail]) :- assert(ev_2006_07_uefa_champions_league_OR_march_2016(Start,End)), generate_facts_ev_2006_07_uefa_champions_league_OR_march_2016(Tail).

ev_2006_07_uefa_champions_league_OR_march_2016_aux() :- findall((Start,End),ev_2006_07_uefa_champions_league(Start,End),Interval1), findall((Start,End),march_2016(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2006_07_uefa_champions_league_OR_march_2016(Interval).

ev_2006_07_uefa_champions_league_OR_march_2016_at_1974(Res) :- setof((Start,End),ev_2006_07_uefa_champions_league_OR_march_2016(Start,End),AllINtervals), checkvalidity(1974,AllINtervals,Res).

check_query() :- write('Query = ev_2006_07_uefa_champions_league_OR_march_2016_at_1974'), (ev_2006_07_uefa_champions_league_OR_march_2016_at_1974(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2006_07_uefa_champions_league_OR_march_2016_aux().

