:- include('database.pl').
cold_case(Start,End) :- begin('cold_case',_,_,Start), end('cold_case',_,_,End), Start=<End.

ev_2007_08_premier_league(Start,End) :- begin('ev_2007_08_premier_league',_,_,Start), end('ev_2007_08_premier_league',_,_,End), Start=<End.

generate_facts_cold_case_AND_ev_2007_08_premier_league([]) :- assert(cold_case_AND_ev_2007_08_premier_league(-1,-1)).

generate_facts_cold_case_AND_ev_2007_08_premier_league([(Start,End) | Tail]) :- assert(cold_case_AND_ev_2007_08_premier_league(Start,End)), generate_facts_cold_case_AND_ev_2007_08_premier_league(Tail).

cold_case_AND_ev_2007_08_premier_league_aux() :- findall((Start,End),cold_case(Start,End),Interval1), findall((Start,End),ev_2007_08_premier_league(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_cold_case_AND_ev_2007_08_premier_league(Interval).

cold_case_AND_ev_2007_08_premier_league_at_2007(Res) :- setof((Start,End),cold_case_AND_ev_2007_08_premier_league(Start,End),AllINtervals), checkvalidity(2007,AllINtervals,Res).

check_query() :- write('Query = cold_case_AND_ev_2007_08_premier_league_at_2007'), (cold_case_AND_ev_2007_08_premier_league_at_2007(true) -> write('\nRes   = true');write('\nRes   = false')).
?- cold_case_AND_ev_2007_08_premier_league_aux().

