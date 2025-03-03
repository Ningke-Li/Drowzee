:- include('database.pl').
the_office(Start,End) :- begin('the_office',_,_,Start), end('the_office',_,_,End), Start=<End.

continuation_war(Start,End) :- begin('continuation_war',_,_,Start), end('continuation_war',_,_,End), Start=<End.

generate_facts_the_office_OR_continuation_war([]) :- assert(the_office_OR_continuation_war(-1,-1)).

generate_facts_the_office_OR_continuation_war([(Start,End) | Tail]) :- assert(the_office_OR_continuation_war(Start,End)), generate_facts_the_office_OR_continuation_war(Tail).

the_office_OR_continuation_war_aux() :- findall((Start,End),the_office(Start,End),Interval1), findall((Start,End),continuation_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_the_office_OR_continuation_war(Interval).

the_office_OR_continuation_war_at_2042(Res) :- setof((Start,End),the_office_OR_continuation_war(Start,End),AllINtervals), checkvalidity(2042,AllINtervals,Res).

check_query() :- write('Query = the_office_OR_continuation_war_at_2042'), (the_office_OR_continuation_war_at_2042(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_office_OR_continuation_war_aux().

