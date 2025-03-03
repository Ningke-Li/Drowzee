:- include('database.pl').
ev_24(Start,End) :- begin('ev_24',_,_,Start), end('ev_24',_,_,End), Start=<End.

ev_2002_03_fa_premier_league(Start,End) :- begin('ev_2002_03_fa_premier_league',_,_,Start), end('ev_2002_03_fa_premier_league',_,_,End), Start=<End.

generate_facts_ev_24_AND_ev_2002_03_fa_premier_league([]) :- assert(ev_24_AND_ev_2002_03_fa_premier_league(-1,-1)).

generate_facts_ev_24_AND_ev_2002_03_fa_premier_league([(Start,End) | Tail]) :- assert(ev_24_AND_ev_2002_03_fa_premier_league(Start,End)), generate_facts_ev_24_AND_ev_2002_03_fa_premier_league(Tail).

ev_24_AND_ev_2002_03_fa_premier_league_aux() :- findall((Start,End),ev_24(Start,End),Interval1), findall((Start,End),ev_2002_03_fa_premier_league(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_24_AND_ev_2002_03_fa_premier_league(Interval).

ev_24_AND_ev_2002_03_fa_premier_league_at_2012(Res) :- setof((Start,End),ev_24_AND_ev_2002_03_fa_premier_league(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = ev_24_AND_ev_2002_03_fa_premier_league_at_2012'), (ev_24_AND_ev_2002_03_fa_premier_league_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_24_AND_ev_2002_03_fa_premier_league_aux().

