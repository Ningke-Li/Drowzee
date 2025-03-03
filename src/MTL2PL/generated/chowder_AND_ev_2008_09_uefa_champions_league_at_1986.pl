:- include('database.pl').
chowder(Start,End) :- begin('chowder',_,_,Start), end('chowder',_,_,End), Start=<End.

ev_2008_09_uefa_champions_league(Start,End) :- begin('ev_2008_09_uefa_champions_league',_,_,Start), end('ev_2008_09_uefa_champions_league',_,_,End), Start=<End.

generate_facts_chowder_AND_ev_2008_09_uefa_champions_league([]) :- assert(chowder_AND_ev_2008_09_uefa_champions_league(-1,-1)).

generate_facts_chowder_AND_ev_2008_09_uefa_champions_league([(Start,End) | Tail]) :- assert(chowder_AND_ev_2008_09_uefa_champions_league(Start,End)), generate_facts_chowder_AND_ev_2008_09_uefa_champions_league(Tail).

chowder_AND_ev_2008_09_uefa_champions_league_aux() :- findall((Start,End),chowder(Start,End),Interval1), findall((Start,End),ev_2008_09_uefa_champions_league(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_chowder_AND_ev_2008_09_uefa_champions_league(Interval).

chowder_AND_ev_2008_09_uefa_champions_league_at_1986(Res) :- setof((Start,End),chowder_AND_ev_2008_09_uefa_champions_league(Start,End),AllINtervals), checkvalidity(1986,AllINtervals,Res).

check_query() :- write('Query = chowder_AND_ev_2008_09_uefa_champions_league_at_1986'), (chowder_AND_ev_2008_09_uefa_champions_league_at_1986(true) -> write('\nRes   = true');write('\nRes   = false')).
?- chowder_AND_ev_2008_09_uefa_champions_league_aux().

