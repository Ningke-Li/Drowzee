:- include('database.pl').
second_french_empire(Start,End) :- begin('second_french_empire',_,_,Start), end('second_french_empire',_,_,End), Start=<End.

ev_2006_07_uefa_champions_league(Start,End) :- begin('ev_2006_07_uefa_champions_league',_,_,Start), end('ev_2006_07_uefa_champions_league',_,_,End), Start=<End.

generate_facts_second_french_empire_OR_ev_2006_07_uefa_champions_league([]) :- assert(second_french_empire_OR_ev_2006_07_uefa_champions_league(-1,-1)).

generate_facts_second_french_empire_OR_ev_2006_07_uefa_champions_league([(Start,End) | Tail]) :- assert(second_french_empire_OR_ev_2006_07_uefa_champions_league(Start,End)), generate_facts_second_french_empire_OR_ev_2006_07_uefa_champions_league(Tail).

second_french_empire_OR_ev_2006_07_uefa_champions_league_aux() :- findall((Start,End),second_french_empire(Start,End),Interval1), findall((Start,End),ev_2006_07_uefa_champions_league(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_second_french_empire_OR_ev_2006_07_uefa_champions_league(Interval).

second_french_empire_OR_ev_2006_07_uefa_champions_league_at_1909(Res) :- setof((Start,End),second_french_empire_OR_ev_2006_07_uefa_champions_league(Start,End),AllINtervals), checkvalidity(1909,AllINtervals,Res).

check_query() :- write('Query = second_french_empire_OR_ev_2006_07_uefa_champions_league_at_1909'), (second_french_empire_OR_ev_2006_07_uefa_champions_league_at_1909(true) -> write('\nRes   = true');write('\nRes   = false')).
?- second_french_empire_OR_ev_2006_07_uefa_champions_league_aux().

