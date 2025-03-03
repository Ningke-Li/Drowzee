:- include('database.pl').
boxer_rebellion(Start,End) :- begin('boxer_rebellion',_,_,Start), end('boxer_rebellion',_,_,End), Start=<End.

ev_2005_06_fa_premier_league(Start,End) :- begin('ev_2005_06_fa_premier_league',_,_,Start), end('ev_2005_06_fa_premier_league',_,_,End), Start=<End.

generate_facts_boxer_rebellion_OR_ev_2005_06_fa_premier_league([]) :- assert(boxer_rebellion_OR_ev_2005_06_fa_premier_league(-1,-1)).

generate_facts_boxer_rebellion_OR_ev_2005_06_fa_premier_league([(Start,End) | Tail]) :- assert(boxer_rebellion_OR_ev_2005_06_fa_premier_league(Start,End)), generate_facts_boxer_rebellion_OR_ev_2005_06_fa_premier_league(Tail).

boxer_rebellion_OR_ev_2005_06_fa_premier_league_aux() :- findall((Start,End),boxer_rebellion(Start,End),Interval1), findall((Start,End),ev_2005_06_fa_premier_league(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_boxer_rebellion_OR_ev_2005_06_fa_premier_league(Interval).

boxer_rebellion_OR_ev_2005_06_fa_premier_league_at_2006(Res) :- setof((Start,End),boxer_rebellion_OR_ev_2005_06_fa_premier_league(Start,End),AllINtervals), checkvalidity(2006,AllINtervals,Res).

check_query() :- write('Query = boxer_rebellion_OR_ev_2005_06_fa_premier_league_at_2006'), (boxer_rebellion_OR_ev_2005_06_fa_premier_league_at_2006(true) -> write('\nRes   = true');write('\nRes   = false')).
?- boxer_rebellion_OR_ev_2005_06_fa_premier_league_aux().

