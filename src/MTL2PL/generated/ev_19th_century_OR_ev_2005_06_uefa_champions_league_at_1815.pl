:- include('database.pl').
ev_19th_century(Start,End) :- begin('ev_19th_century',_,_,Start), end('ev_19th_century',_,_,End), Start=<End.

ev_2005_06_uefa_champions_league(Start,End) :- begin('ev_2005_06_uefa_champions_league',_,_,Start), end('ev_2005_06_uefa_champions_league',_,_,End), Start=<End.

generate_facts_ev_19th_century_OR_ev_2005_06_uefa_champions_league([]) :- assert(ev_19th_century_OR_ev_2005_06_uefa_champions_league(-1,-1)).

generate_facts_ev_19th_century_OR_ev_2005_06_uefa_champions_league([(Start,End) | Tail]) :- assert(ev_19th_century_OR_ev_2005_06_uefa_champions_league(Start,End)), generate_facts_ev_19th_century_OR_ev_2005_06_uefa_champions_league(Tail).

ev_19th_century_OR_ev_2005_06_uefa_champions_league_aux() :- findall((Start,End),ev_19th_century(Start,End),Interval1), findall((Start,End),ev_2005_06_uefa_champions_league(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_19th_century_OR_ev_2005_06_uefa_champions_league(Interval).

ev_19th_century_OR_ev_2005_06_uefa_champions_league_at_1815(Res) :- setof((Start,End),ev_19th_century_OR_ev_2005_06_uefa_champions_league(Start,End),AllINtervals), checkvalidity(1815,AllINtervals,Res).

check_query() :- write('Query = ev_19th_century_OR_ev_2005_06_uefa_champions_league_at_1815'), (ev_19th_century_OR_ev_2005_06_uefa_champions_league_at_1815(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_19th_century_OR_ev_2005_06_uefa_champions_league_aux().

