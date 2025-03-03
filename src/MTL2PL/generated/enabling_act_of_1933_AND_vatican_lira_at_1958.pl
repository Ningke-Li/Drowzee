:- include('database.pl').
enabling_act_of_1933(Start,End) :- begin('enabling_act_of_1933',_,_,Start), end('enabling_act_of_1933',_,_,End), Start=<End.

vatican_lira(Start,End) :- begin('vatican_lira',_,_,Start), end('vatican_lira',_,_,End), Start=<End.

generate_facts_enabling_act_of_1933_AND_vatican_lira([]) :- assert(enabling_act_of_1933_AND_vatican_lira(-1,-1)).

generate_facts_enabling_act_of_1933_AND_vatican_lira([(Start,End) | Tail]) :- assert(enabling_act_of_1933_AND_vatican_lira(Start,End)), generate_facts_enabling_act_of_1933_AND_vatican_lira(Tail).

enabling_act_of_1933_AND_vatican_lira_aux() :- findall((Start,End),enabling_act_of_1933(Start,End),Interval1), findall((Start,End),vatican_lira(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_enabling_act_of_1933_AND_vatican_lira(Interval).

enabling_act_of_1933_AND_vatican_lira_at_1958(Res) :- setof((Start,End),enabling_act_of_1933_AND_vatican_lira(Start,End),AllINtervals), checkvalidity(1958,AllINtervals,Res).

check_query() :- write('Query = enabling_act_of_1933_AND_vatican_lira_at_1958'), (enabling_act_of_1933_AND_vatican_lira_at_1958(true) -> write('\nRes   = true');write('\nRes   = false')).
?- enabling_act_of_1933_AND_vatican_lira_aux().

