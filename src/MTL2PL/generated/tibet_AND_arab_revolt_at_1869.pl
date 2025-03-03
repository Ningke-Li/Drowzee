:- include('database.pl').
tibet(Start,End) :- begin('tibet',_,_,Start), end('tibet',_,_,End), Start=<End.

arab_revolt(Start,End) :- begin('arab_revolt',_,_,Start), end('arab_revolt',_,_,End), Start=<End.

generate_facts_tibet_AND_arab_revolt([]) :- assert(tibet_AND_arab_revolt(-1,-1)).

generate_facts_tibet_AND_arab_revolt([(Start,End) | Tail]) :- assert(tibet_AND_arab_revolt(Start,End)), generate_facts_tibet_AND_arab_revolt(Tail).

tibet_AND_arab_revolt_aux() :- findall((Start,End),tibet(Start,End),Interval1), findall((Start,End),arab_revolt(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_tibet_AND_arab_revolt(Interval).

tibet_AND_arab_revolt_at_1869(Res) :- setof((Start,End),tibet_AND_arab_revolt(Start,End),AllINtervals), checkvalidity(1869,AllINtervals,Res).

check_query() :- write('Query = tibet_AND_arab_revolt_at_1869'), (tibet_AND_arab_revolt_at_1869(true) -> write('\nRes   = true');write('\nRes   = false')).
?- tibet_AND_arab_revolt_aux().

