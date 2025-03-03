:- include('database.pl').
bol_var(Start,End) :- begin('bol_var',_,_,Start), end('bol_var',_,_,End), Start=<End.

ev_2006_07_fa_premier_league(Start,End) :- begin('ev_2006_07_fa_premier_league',_,_,Start), end('ev_2006_07_fa_premier_league',_,_,End), Start=<End.

generate_facts_bol_var_AND_ev_2006_07_fa_premier_league([]) :- assert(bol_var_AND_ev_2006_07_fa_premier_league(-1,-1)).

generate_facts_bol_var_AND_ev_2006_07_fa_premier_league([(Start,End) | Tail]) :- assert(bol_var_AND_ev_2006_07_fa_premier_league(Start,End)), generate_facts_bol_var_AND_ev_2006_07_fa_premier_league(Tail).

bol_var_AND_ev_2006_07_fa_premier_league_aux() :- findall((Start,End),bol_var(Start,End),Interval1), findall((Start,End),ev_2006_07_fa_premier_league(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_bol_var_AND_ev_2006_07_fa_premier_league(Interval).

bol_var_AND_ev_2006_07_fa_premier_league_at_2007(Res) :- setof((Start,End),bol_var_AND_ev_2006_07_fa_premier_league(Start,End),AllINtervals), checkvalidity(2007,AllINtervals,Res).

check_query() :- write('Query = bol_var_AND_ev_2006_07_fa_premier_league_at_2007'), (bol_var_AND_ev_2006_07_fa_premier_league_at_2007(true) -> write('\nRes   = true');write('\nRes   = false')).
?- bol_var_AND_ev_2006_07_fa_premier_league_aux().

