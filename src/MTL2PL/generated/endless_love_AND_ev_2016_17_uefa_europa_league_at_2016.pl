:- include('database.pl').
endless_love(Start,End) :- begin('endless_love',_,_,Start), end('endless_love',_,_,End), Start=<End.

ev_2016_17_uefa_europa_league(Start,End) :- begin('ev_2016_17_uefa_europa_league',_,_,Start), end('ev_2016_17_uefa_europa_league',_,_,End), Start=<End.

generate_facts_endless_love_AND_ev_2016_17_uefa_europa_league([]) :- assert(endless_love_AND_ev_2016_17_uefa_europa_league(-1,-1)).

generate_facts_endless_love_AND_ev_2016_17_uefa_europa_league([(Start,End) | Tail]) :- assert(endless_love_AND_ev_2016_17_uefa_europa_league(Start,End)), generate_facts_endless_love_AND_ev_2016_17_uefa_europa_league(Tail).

endless_love_AND_ev_2016_17_uefa_europa_league_aux() :- findall((Start,End),endless_love(Start,End),Interval1), findall((Start,End),ev_2016_17_uefa_europa_league(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_endless_love_AND_ev_2016_17_uefa_europa_league(Interval).

endless_love_AND_ev_2016_17_uefa_europa_league_at_2016(Res) :- setof((Start,End),endless_love_AND_ev_2016_17_uefa_europa_league(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = endless_love_AND_ev_2016_17_uefa_europa_league_at_2016'), (endless_love_AND_ev_2016_17_uefa_europa_league_at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).
?- endless_love_AND_ev_2016_17_uefa_europa_league_aux().

