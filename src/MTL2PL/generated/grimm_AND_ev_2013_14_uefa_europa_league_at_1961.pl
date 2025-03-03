:- include('database.pl').
grimm(Start,End) :- begin('grimm',_,_,Start), end('grimm',_,_,End), Start=<End.

ev_2013_14_uefa_europa_league(Start,End) :- begin('ev_2013_14_uefa_europa_league',_,_,Start), end('ev_2013_14_uefa_europa_league',_,_,End), Start=<End.

generate_facts_grimm_AND_ev_2013_14_uefa_europa_league([]) :- assert(grimm_AND_ev_2013_14_uefa_europa_league(-1,-1)).

generate_facts_grimm_AND_ev_2013_14_uefa_europa_league([(Start,End) | Tail]) :- assert(grimm_AND_ev_2013_14_uefa_europa_league(Start,End)), generate_facts_grimm_AND_ev_2013_14_uefa_europa_league(Tail).

grimm_AND_ev_2013_14_uefa_europa_league_aux() :- findall((Start,End),grimm(Start,End),Interval1), findall((Start,End),ev_2013_14_uefa_europa_league(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_grimm_AND_ev_2013_14_uefa_europa_league(Interval).

grimm_AND_ev_2013_14_uefa_europa_league_at_1961(Res) :- setof((Start,End),grimm_AND_ev_2013_14_uefa_europa_league(Start,End),AllINtervals), checkvalidity(1961,AllINtervals,Res).

check_query() :- write('Query = grimm_AND_ev_2013_14_uefa_europa_league_at_1961'), (grimm_AND_ev_2013_14_uefa_europa_league_at_1961(true) -> write('\nRes   = true');write('\nRes   = false')).
?- grimm_AND_ev_2013_14_uefa_europa_league_aux().

