:- include('database.pl').
ev_2002_03_fa_premier_league(Start,End) :- begin('ev_2002_03_fa_premier_league',_,_,Start), end('ev_2002_03_fa_premier_league',_,_,End), Start=<End.

estonian_kroon(Start,End) :- begin('estonian_kroon',_,_,Start), end('estonian_kroon',_,_,End), Start=<End.

generate_facts_ev_2002_03_fa_premier_league_AND_estonian_kroon([]) :- assert(ev_2002_03_fa_premier_league_AND_estonian_kroon(-1,-1)).

generate_facts_ev_2002_03_fa_premier_league_AND_estonian_kroon([(Start,End) | Tail]) :- assert(ev_2002_03_fa_premier_league_AND_estonian_kroon(Start,End)), generate_facts_ev_2002_03_fa_premier_league_AND_estonian_kroon(Tail).

ev_2002_03_fa_premier_league_AND_estonian_kroon_aux() :- findall((Start,End),ev_2002_03_fa_premier_league(Start,End),Interval1), findall((Start,End),estonian_kroon(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2002_03_fa_premier_league_AND_estonian_kroon(Interval).

ev_2002_03_fa_premier_league_AND_estonian_kroon_at_2036(Res) :- setof((Start,End),ev_2002_03_fa_premier_league_AND_estonian_kroon(Start,End),AllINtervals), checkvalidity(2036,AllINtervals,Res).

check_query() :- write('Query = ev_2002_03_fa_premier_league_AND_estonian_kroon_at_2036'), (ev_2002_03_fa_premier_league_AND_estonian_kroon_at_2036(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2002_03_fa_premier_league_AND_estonian_kroon_aux().

