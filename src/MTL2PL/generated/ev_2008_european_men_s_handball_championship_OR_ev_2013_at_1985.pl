:- include('database.pl').
ev_2008_european_men_s_handball_championship(Start,End) :- begin('ev_2008_european_men_s_handball_championship',_,_,Start), end('ev_2008_european_men_s_handball_championship',_,_,End), Start=<End.

ev_2013(Start,End) :- begin('ev_2013',_,_,Start), end('ev_2013',_,_,End), Start=<End.

generate_facts_ev_2008_european_men_s_handball_championship_OR_ev_2013([]) :- assert(ev_2008_european_men_s_handball_championship_OR_ev_2013(-1,-1)).

generate_facts_ev_2008_european_men_s_handball_championship_OR_ev_2013([(Start,End) | Tail]) :- assert(ev_2008_european_men_s_handball_championship_OR_ev_2013(Start,End)), generate_facts_ev_2008_european_men_s_handball_championship_OR_ev_2013(Tail).

ev_2008_european_men_s_handball_championship_OR_ev_2013_aux() :- findall((Start,End),ev_2008_european_men_s_handball_championship(Start,End),Interval1), findall((Start,End),ev_2013(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2008_european_men_s_handball_championship_OR_ev_2013(Interval).

ev_2008_european_men_s_handball_championship_OR_ev_2013_at_1985(Res) :- setof((Start,End),ev_2008_european_men_s_handball_championship_OR_ev_2013(Start,End),AllINtervals), checkvalidity(1985,AllINtervals,Res).

check_query() :- write('Query = ev_2008_european_men_s_handball_championship_OR_ev_2013_at_1985'), (ev_2008_european_men_s_handball_championship_OR_ev_2013_at_1985(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2008_european_men_s_handball_championship_OR_ev_2013_aux().

