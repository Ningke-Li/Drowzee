:- include('database.pl').
desperate_housewives(Start,End) :- begin('desperate_housewives',_,_,Start), end('desperate_housewives',_,_,End), Start=<End.

ev_2006_07_fa_premier_league(Start,End) :- begin('ev_2006_07_fa_premier_league',_,_,Start), end('ev_2006_07_fa_premier_league',_,_,End), Start=<End.

generate_facts_desperate_housewives_OR_ev_2006_07_fa_premier_league([]) :- assert(desperate_housewives_OR_ev_2006_07_fa_premier_league(-1,-1)).

generate_facts_desperate_housewives_OR_ev_2006_07_fa_premier_league([(Start,End) | Tail]) :- assert(desperate_housewives_OR_ev_2006_07_fa_premier_league(Start,End)), generate_facts_desperate_housewives_OR_ev_2006_07_fa_premier_league(Tail).

desperate_housewives_OR_ev_2006_07_fa_premier_league_aux() :- findall((Start,End),desperate_housewives(Start,End),Interval1), findall((Start,End),ev_2006_07_fa_premier_league(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_desperate_housewives_OR_ev_2006_07_fa_premier_league(Interval).

desperate_housewives_OR_ev_2006_07_fa_premier_league_at_2006(Res) :- setof((Start,End),desperate_housewives_OR_ev_2006_07_fa_premier_league(Start,End),AllINtervals), checkvalidity(2006,AllINtervals,Res).

check_query() :- write('Query = desperate_housewives_OR_ev_2006_07_fa_premier_league_at_2006'), (desperate_housewives_OR_ev_2006_07_fa_premier_league_at_2006(true) -> write('\nRes   = true');write('\nRes   = false')).
?- desperate_housewives_OR_ev_2006_07_fa_premier_league_aux().

