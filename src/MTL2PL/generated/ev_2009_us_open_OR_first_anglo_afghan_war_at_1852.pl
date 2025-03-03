:- include('database.pl').
ev_2009_us_open(Start,End) :- begin('ev_2009_us_open',_,_,Start), end('ev_2009_us_open',_,_,End), Start=<End.

first_anglo_afghan_war(Start,End) :- begin('first_anglo_afghan_war',_,_,Start), end('first_anglo_afghan_war',_,_,End), Start=<End.

generate_facts_ev_2009_us_open_OR_first_anglo_afghan_war([]) :- assert(ev_2009_us_open_OR_first_anglo_afghan_war(-1,-1)).

generate_facts_ev_2009_us_open_OR_first_anglo_afghan_war([(Start,End) | Tail]) :- assert(ev_2009_us_open_OR_first_anglo_afghan_war(Start,End)), generate_facts_ev_2009_us_open_OR_first_anglo_afghan_war(Tail).

ev_2009_us_open_OR_first_anglo_afghan_war_aux() :- findall((Start,End),ev_2009_us_open(Start,End),Interval1), findall((Start,End),first_anglo_afghan_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2009_us_open_OR_first_anglo_afghan_war(Interval).

ev_2009_us_open_OR_first_anglo_afghan_war_at_1852(Res) :- setof((Start,End),ev_2009_us_open_OR_first_anglo_afghan_war(Start,End),AllINtervals), checkvalidity(1852,AllINtervals,Res).

check_query() :- write('Query = ev_2009_us_open_OR_first_anglo_afghan_war_at_1852'), (ev_2009_us_open_OR_first_anglo_afghan_war_at_1852(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2009_us_open_OR_first_anglo_afghan_war_aux().

