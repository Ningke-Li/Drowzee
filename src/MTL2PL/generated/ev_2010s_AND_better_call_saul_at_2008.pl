:- include('database.pl').
ev_2010s(Start,End) :- begin('ev_2010s',_,_,Start), end('ev_2010s',_,_,End), Start=<End.

better_call_saul(Start,End) :- begin('better_call_saul',_,_,Start), end('better_call_saul',_,_,End), Start=<End.

generate_facts_ev_2010s_AND_better_call_saul([]) :- assert(ev_2010s_AND_better_call_saul(-1,-1)).

generate_facts_ev_2010s_AND_better_call_saul([(Start,End) | Tail]) :- assert(ev_2010s_AND_better_call_saul(Start,End)), generate_facts_ev_2010s_AND_better_call_saul(Tail).

ev_2010s_AND_better_call_saul_aux() :- findall((Start,End),ev_2010s(Start,End),Interval1), findall((Start,End),better_call_saul(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2010s_AND_better_call_saul(Interval).

ev_2010s_AND_better_call_saul_at_2008(Res) :- setof((Start,End),ev_2010s_AND_better_call_saul(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = ev_2010s_AND_better_call_saul_at_2008'), (ev_2010s_AND_better_call_saul_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2010s_AND_better_call_saul_aux().

