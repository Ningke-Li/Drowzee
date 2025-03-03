:- include('database.pl').
italian_lira(Start,End) :- begin('italian_lira',_,_,Start), end('italian_lira',_,_,End), Start=<End.

the_holocaust(Start,End) :- begin('the_holocaust',_,_,Start), end('the_holocaust',_,_,End), Start=<End.

generate_facts_italian_lira_AND_the_holocaust([]) :- assert(italian_lira_AND_the_holocaust(-1,-1)).

generate_facts_italian_lira_AND_the_holocaust([(Start,End) | Tail]) :- assert(italian_lira_AND_the_holocaust(Start,End)), generate_facts_italian_lira_AND_the_holocaust(Tail).

italian_lira_AND_the_holocaust_aux() :- findall((Start,End),italian_lira(Start,End),Interval1), findall((Start,End),the_holocaust(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_italian_lira_AND_the_holocaust(Interval).

italian_lira_AND_the_holocaust_at_1976(Res) :- setof((Start,End),italian_lira_AND_the_holocaust(Start,End),AllINtervals), checkvalidity(1976,AllINtervals,Res).

check_query() :- write('Query = italian_lira_AND_the_holocaust_at_1976'), (italian_lira_AND_the_holocaust_at_1976(true) -> write('\nRes   = true');write('\nRes   = false')).
?- italian_lira_AND_the_holocaust_aux().

