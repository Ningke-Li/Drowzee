:- include('database.pl').
ev_2005_06_uefa_champions_league(Start,End) :- begin('ev_2005_06_uefa_champions_league',_,_,Start), end('ev_2005_06_uefa_champions_league',_,_,End), Start=<End.

operation_weser_bung(Start,End) :- begin('operation_weser_bung',_,_,Start), end('operation_weser_bung',_,_,End), Start=<End.

generate_facts_ev_2005_06_uefa_champions_league_OR_operation_weser_bung([]) :- assert(ev_2005_06_uefa_champions_league_OR_operation_weser_bung(-1,-1)).

generate_facts_ev_2005_06_uefa_champions_league_OR_operation_weser_bung([(Start,End) | Tail]) :- assert(ev_2005_06_uefa_champions_league_OR_operation_weser_bung(Start,End)), generate_facts_ev_2005_06_uefa_champions_league_OR_operation_weser_bung(Tail).

ev_2005_06_uefa_champions_league_OR_operation_weser_bung_aux() :- findall((Start,End),ev_2005_06_uefa_champions_league(Start,End),Interval1), findall((Start,End),operation_weser_bung(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2005_06_uefa_champions_league_OR_operation_weser_bung(Interval).

ev_2005_06_uefa_champions_league_OR_operation_weser_bung_at_1940(Res) :- setof((Start,End),ev_2005_06_uefa_champions_league_OR_operation_weser_bung(Start,End),AllINtervals), checkvalidity(1940,AllINtervals,Res).

check_query() :- write('Query = ev_2005_06_uefa_champions_league_OR_operation_weser_bung_at_1940'), (ev_2005_06_uefa_champions_league_OR_operation_weser_bung_at_1940(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2005_06_uefa_champions_league_OR_operation_weser_bung_aux().

