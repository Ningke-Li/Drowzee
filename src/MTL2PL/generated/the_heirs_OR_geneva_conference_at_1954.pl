:- include('database.pl').
the_heirs(Start,End) :- begin('the_heirs',_,_,Start), end('the_heirs',_,_,End), Start=<End.

geneva_conference(Start,End) :- begin('geneva_conference',_,_,Start), end('geneva_conference',_,_,End), Start=<End.

generate_facts_the_heirs_OR_geneva_conference([]) :- assert(the_heirs_OR_geneva_conference(-1,-1)).

generate_facts_the_heirs_OR_geneva_conference([(Start,End) | Tail]) :- assert(the_heirs_OR_geneva_conference(Start,End)), generate_facts_the_heirs_OR_geneva_conference(Tail).

the_heirs_OR_geneva_conference_aux() :- findall((Start,End),the_heirs(Start,End),Interval1), findall((Start,End),geneva_conference(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_the_heirs_OR_geneva_conference(Interval).

the_heirs_OR_geneva_conference_at_1954(Res) :- setof((Start,End),the_heirs_OR_geneva_conference(Start,End),AllINtervals), checkvalidity(1954,AllINtervals,Res).

check_query() :- write('Query = the_heirs_OR_geneva_conference_at_1954'), (the_heirs_OR_geneva_conference_at_1954(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_heirs_OR_geneva_conference_aux().

