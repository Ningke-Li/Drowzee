:- include('database.pl').
yugoslav_dinar(Start,End) :- begin('yugoslav_dinar',_,_,Start), end('yugoslav_dinar',_,_,End), Start=<End.

ev_2003_04_uefa_champions_league(Start,End) :- begin('ev_2003_04_uefa_champions_league',_,_,Start), end('ev_2003_04_uefa_champions_league',_,_,End), Start=<End.

generate_facts_yugoslav_dinar_OR_ev_2003_04_uefa_champions_league([]) :- assert(yugoslav_dinar_OR_ev_2003_04_uefa_champions_league(-1,-1)).

generate_facts_yugoslav_dinar_OR_ev_2003_04_uefa_champions_league([(Start,End) | Tail]) :- assert(yugoslav_dinar_OR_ev_2003_04_uefa_champions_league(Start,End)), generate_facts_yugoslav_dinar_OR_ev_2003_04_uefa_champions_league(Tail).

yugoslav_dinar_OR_ev_2003_04_uefa_champions_league_aux() :- findall((Start,End),yugoslav_dinar(Start,End),Interval1), findall((Start,End),ev_2003_04_uefa_champions_league(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_yugoslav_dinar_OR_ev_2003_04_uefa_champions_league(Interval).

yugoslav_dinar_OR_ev_2003_04_uefa_champions_league_at_1956(Res) :- setof((Start,End),yugoslav_dinar_OR_ev_2003_04_uefa_champions_league(Start,End),AllINtervals), checkvalidity(1956,AllINtervals,Res).

check_query() :- write('Query = yugoslav_dinar_OR_ev_2003_04_uefa_champions_league_at_1956'), (yugoslav_dinar_OR_ev_2003_04_uefa_champions_league_at_1956(true) -> write('\nRes   = true');write('\nRes   = false')).
?- yugoslav_dinar_OR_ev_2003_04_uefa_champions_league_aux().

