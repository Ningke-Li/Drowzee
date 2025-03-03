:- include('database.pl').
k_the_kollwitz(Start,End) :- begin('k_the_kollwitz',_,_,Start), end('k_the_kollwitz',_,_,End), Start=<End.

ev_2004_05_fa_premier_league(Start,End) :- begin('ev_2004_05_fa_premier_league',_,_,Start), end('ev_2004_05_fa_premier_league',_,_,End), Start=<End.

generate_facts_k_the_kollwitz_OR_ev_2004_05_fa_premier_league([]) :- assert(k_the_kollwitz_OR_ev_2004_05_fa_premier_league(-1,-1)).

generate_facts_k_the_kollwitz_OR_ev_2004_05_fa_premier_league([(Start,End) | Tail]) :- assert(k_the_kollwitz_OR_ev_2004_05_fa_premier_league(Start,End)), generate_facts_k_the_kollwitz_OR_ev_2004_05_fa_premier_league(Tail).

k_the_kollwitz_OR_ev_2004_05_fa_premier_league_aux() :- findall((Start,End),k_the_kollwitz(Start,End),Interval1), findall((Start,End),ev_2004_05_fa_premier_league(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_k_the_kollwitz_OR_ev_2004_05_fa_premier_league(Interval).

k_the_kollwitz_OR_ev_2004_05_fa_premier_league_at_2004(Res) :- setof((Start,End),k_the_kollwitz_OR_ev_2004_05_fa_premier_league(Start,End),AllINtervals), checkvalidity(2004,AllINtervals,Res).

check_query() :- write('Query = k_the_kollwitz_OR_ev_2004_05_fa_premier_league_at_2004'), (k_the_kollwitz_OR_ev_2004_05_fa_premier_league_at_2004(true) -> write('\nRes   = true');write('\nRes   = false')).
?- k_the_kollwitz_OR_ev_2004_05_fa_premier_league_aux().

