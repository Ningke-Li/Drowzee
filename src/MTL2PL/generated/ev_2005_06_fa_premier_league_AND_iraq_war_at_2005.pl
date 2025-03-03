:- include('database.pl').
ev_2005_06_fa_premier_league(Start,End) :- begin('ev_2005_06_fa_premier_league',_,_,Start), end('ev_2005_06_fa_premier_league',_,_,End), Start=<End.

iraq_war(Start,End) :- begin('iraq_war',_,_,Start), end('iraq_war',_,_,End), Start=<End.

generate_facts_ev_2005_06_fa_premier_league_AND_iraq_war([]) :- assert(ev_2005_06_fa_premier_league_AND_iraq_war(-1,-1)).

generate_facts_ev_2005_06_fa_premier_league_AND_iraq_war([(Start,End) | Tail]) :- assert(ev_2005_06_fa_premier_league_AND_iraq_war(Start,End)), generate_facts_ev_2005_06_fa_premier_league_AND_iraq_war(Tail).

ev_2005_06_fa_premier_league_AND_iraq_war_aux() :- findall((Start,End),ev_2005_06_fa_premier_league(Start,End),Interval1), findall((Start,End),iraq_war(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2005_06_fa_premier_league_AND_iraq_war(Interval).

ev_2005_06_fa_premier_league_AND_iraq_war_at_2005(Res) :- setof((Start,End),ev_2005_06_fa_premier_league_AND_iraq_war(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = ev_2005_06_fa_premier_league_AND_iraq_war_at_2005'), (ev_2005_06_fa_premier_league_AND_iraq_war_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2005_06_fa_premier_league_AND_iraq_war_aux().

