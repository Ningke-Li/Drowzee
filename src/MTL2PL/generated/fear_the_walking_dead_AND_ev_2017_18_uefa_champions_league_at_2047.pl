:- include('database.pl').
fear_the_walking_dead(Start,End) :- begin('fear_the_walking_dead',_,_,Start), end('fear_the_walking_dead',_,_,End), Start=<End.

ev_2017_18_uefa_champions_league(Start,End) :- begin('ev_2017_18_uefa_champions_league',_,_,Start), end('ev_2017_18_uefa_champions_league',_,_,End), Start=<End.

generate_facts_fear_the_walking_dead_AND_ev_2017_18_uefa_champions_league([]) :- assert(fear_the_walking_dead_AND_ev_2017_18_uefa_champions_league(-1,-1)).

generate_facts_fear_the_walking_dead_AND_ev_2017_18_uefa_champions_league([(Start,End) | Tail]) :- assert(fear_the_walking_dead_AND_ev_2017_18_uefa_champions_league(Start,End)), generate_facts_fear_the_walking_dead_AND_ev_2017_18_uefa_champions_league(Tail).

fear_the_walking_dead_AND_ev_2017_18_uefa_champions_league_aux() :- findall((Start,End),fear_the_walking_dead(Start,End),Interval1), findall((Start,End),ev_2017_18_uefa_champions_league(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_fear_the_walking_dead_AND_ev_2017_18_uefa_champions_league(Interval).

fear_the_walking_dead_AND_ev_2017_18_uefa_champions_league_at_2047(Res) :- setof((Start,End),fear_the_walking_dead_AND_ev_2017_18_uefa_champions_league(Start,End),AllINtervals), checkvalidity(2047,AllINtervals,Res).

check_query() :- write('Query = fear_the_walking_dead_AND_ev_2017_18_uefa_champions_league_at_2047'), (fear_the_walking_dead_AND_ev_2017_18_uefa_champions_league_at_2047(true) -> write('\nRes   = true');write('\nRes   = false')).
?- fear_the_walking_dead_AND_ev_2017_18_uefa_champions_league_aux().

