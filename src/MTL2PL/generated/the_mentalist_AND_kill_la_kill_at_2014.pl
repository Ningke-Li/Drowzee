:- include('database.pl').
the_mentalist(Start,End) :- begin('the_mentalist',_,_,Start), end('the_mentalist',_,_,End), Start=<End.

kill_la_kill(Start,End) :- begin('kill_la_kill',_,_,Start), end('kill_la_kill',_,_,End), Start=<End.

generate_facts_the_mentalist_AND_kill_la_kill([]) :- assert(the_mentalist_AND_kill_la_kill(-1,-1)).

generate_facts_the_mentalist_AND_kill_la_kill([(Start,End) | Tail]) :- assert(the_mentalist_AND_kill_la_kill(Start,End)), generate_facts_the_mentalist_AND_kill_la_kill(Tail).

the_mentalist_AND_kill_la_kill_aux() :- findall((Start,End),the_mentalist(Start,End),Interval1), findall((Start,End),kill_la_kill(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_mentalist_AND_kill_la_kill(Interval).

the_mentalist_AND_kill_la_kill_at_2014(Res) :- setof((Start,End),the_mentalist_AND_kill_la_kill(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = the_mentalist_AND_kill_la_kill_at_2014'), (the_mentalist_AND_kill_la_kill_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_mentalist_AND_kill_la_kill_aux().

