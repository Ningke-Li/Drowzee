:- include('database.pl').
ev_2000_01_uefa_champions_league(Start,End) :- begin('ev_2000_01_uefa_champions_league',_,_,Start), end('ev_2000_01_uefa_champions_league',_,_,End), Start=<End.

sack_of_rome__1527(Start,End) :- begin('sack_of_rome__1527',_,_,Start), end('sack_of_rome__1527',_,_,End), Start=<End.

generate_facts_ev_2000_01_uefa_champions_league_OR_sack_of_rome__1527([]) :- assert(ev_2000_01_uefa_champions_league_OR_sack_of_rome__1527(-1,-1)).

generate_facts_ev_2000_01_uefa_champions_league_OR_sack_of_rome__1527([(Start,End) | Tail]) :- assert(ev_2000_01_uefa_champions_league_OR_sack_of_rome__1527(Start,End)), generate_facts_ev_2000_01_uefa_champions_league_OR_sack_of_rome__1527(Tail).

ev_2000_01_uefa_champions_league_OR_sack_of_rome__1527_aux() :- findall((Start,End),ev_2000_01_uefa_champions_league(Start,End),Interval1), findall((Start,End),sack_of_rome__1527(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2000_01_uefa_champions_league_OR_sack_of_rome__1527(Interval).

ev_2000_01_uefa_champions_league_OR_sack_of_rome__1527_at_2045(Res) :- setof((Start,End),ev_2000_01_uefa_champions_league_OR_sack_of_rome__1527(Start,End),AllINtervals), checkvalidity(2045,AllINtervals,Res).

check_query() :- write('Query = ev_2000_01_uefa_champions_league_OR_sack_of_rome__1527_at_2045'), (ev_2000_01_uefa_champions_league_OR_sack_of_rome__1527_at_2045(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2000_01_uefa_champions_league_OR_sack_of_rome__1527_aux().

