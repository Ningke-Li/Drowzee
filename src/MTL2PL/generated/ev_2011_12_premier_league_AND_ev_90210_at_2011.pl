:- include('database.pl').
ev_2011_12_premier_league(Start,End) :- begin('ev_2011_12_premier_league',_,_,Start), end('ev_2011_12_premier_league',_,_,End), Start=<End.

ev_90210(Start,End) :- begin('ev_90210',_,_,Start), end('ev_90210',_,_,End), Start=<End.

generate_facts_ev_2011_12_premier_league_AND_ev_90210([]) :- assert(ev_2011_12_premier_league_AND_ev_90210(-1,-1)).

generate_facts_ev_2011_12_premier_league_AND_ev_90210([(Start,End) | Tail]) :- assert(ev_2011_12_premier_league_AND_ev_90210(Start,End)), generate_facts_ev_2011_12_premier_league_AND_ev_90210(Tail).

ev_2011_12_premier_league_AND_ev_90210_aux() :- findall((Start,End),ev_2011_12_premier_league(Start,End),Interval1), findall((Start,End),ev_90210(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2011_12_premier_league_AND_ev_90210(Interval).

ev_2011_12_premier_league_AND_ev_90210_at_2011(Res) :- setof((Start,End),ev_2011_12_premier_league_AND_ev_90210(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = ev_2011_12_premier_league_AND_ev_90210_at_2011'), (ev_2011_12_premier_league_AND_ev_90210_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2011_12_premier_league_AND_ev_90210_aux().

