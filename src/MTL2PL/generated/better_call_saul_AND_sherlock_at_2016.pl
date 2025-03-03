:- include('database.pl').
better_call_saul(Start,End) :- begin('better_call_saul',_,_,Start), end('better_call_saul',_,_,End), Start=<End.

sherlock(Start,End) :- begin('sherlock',_,_,Start), end('sherlock',_,_,End), Start=<End.

generate_facts_better_call_saul_AND_sherlock([]) :- assert(better_call_saul_AND_sherlock(-1,-1)).

generate_facts_better_call_saul_AND_sherlock([(Start,End) | Tail]) :- assert(better_call_saul_AND_sherlock(Start,End)), generate_facts_better_call_saul_AND_sherlock(Tail).

better_call_saul_AND_sherlock_aux() :- findall((Start,End),better_call_saul(Start,End),Interval1), findall((Start,End),sherlock(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_better_call_saul_AND_sherlock(Interval).

better_call_saul_AND_sherlock_at_2016(Res) :- setof((Start,End),better_call_saul_AND_sherlock(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = better_call_saul_AND_sherlock_at_2016'), (better_call_saul_AND_sherlock_at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).
?- better_call_saul_AND_sherlock_aux().

