:- include('database.pl').
narcos(Start,End) :- begin('narcos',_,_,Start), end('narcos',_,_,End), Start=<End.

better_call_saul(Start,End) :- begin('better_call_saul',_,_,Start), end('better_call_saul',_,_,End), Start=<End.

generate_facts_narcos_AND_better_call_saul([]) :- assert(narcos_AND_better_call_saul(-1,-1)).

generate_facts_narcos_AND_better_call_saul([(Start,End) | Tail]) :- assert(narcos_AND_better_call_saul(Start,End)), generate_facts_narcos_AND_better_call_saul(Tail).

narcos_AND_better_call_saul_aux() :- findall((Start,End),narcos(Start,End),Interval1), findall((Start,End),better_call_saul(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_narcos_AND_better_call_saul(Interval).

narcos_AND_better_call_saul_at_2015(Res) :- setof((Start,End),narcos_AND_better_call_saul(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = narcos_AND_better_call_saul_at_2015'), (narcos_AND_better_call_saul_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).
?- narcos_AND_better_call_saul_aux().

