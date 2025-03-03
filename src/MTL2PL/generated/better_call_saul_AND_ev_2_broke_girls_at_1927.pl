:- include('database.pl').
better_call_saul(Start,End) :- begin('better_call_saul',_,_,Start), end('better_call_saul',_,_,End), Start=<End.

ev_2_broke_girls(Start,End) :- begin('ev_2_broke_girls',_,_,Start), end('ev_2_broke_girls',_,_,End), Start=<End.

generate_facts_better_call_saul_AND_ev_2_broke_girls([]) :- assert(better_call_saul_AND_ev_2_broke_girls(-1,-1)).

generate_facts_better_call_saul_AND_ev_2_broke_girls([(Start,End) | Tail]) :- assert(better_call_saul_AND_ev_2_broke_girls(Start,End)), generate_facts_better_call_saul_AND_ev_2_broke_girls(Tail).

better_call_saul_AND_ev_2_broke_girls_aux() :- findall((Start,End),better_call_saul(Start,End),Interval1), findall((Start,End),ev_2_broke_girls(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_better_call_saul_AND_ev_2_broke_girls(Interval).

better_call_saul_AND_ev_2_broke_girls_at_1927(Res) :- setof((Start,End),better_call_saul_AND_ev_2_broke_girls(Start,End),AllINtervals), checkvalidity(1927,AllINtervals,Res).

check_query() :- write('Query = better_call_saul_AND_ev_2_broke_girls_at_1927'), (better_call_saul_AND_ev_2_broke_girls_at_1927(true) -> write('\nRes   = true');write('\nRes   = false')).
?- better_call_saul_AND_ev_2_broke_girls_aux().

