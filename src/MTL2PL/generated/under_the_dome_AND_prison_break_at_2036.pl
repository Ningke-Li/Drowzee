:- include('database.pl').
under_the_dome(Start,End) :- begin('under_the_dome',_,_,Start), end('under_the_dome',_,_,End), Start=<End.

prison_break(Start,End) :- begin('prison_break',_,_,Start), end('prison_break',_,_,End), Start=<End.

generate_facts_under_the_dome_AND_prison_break([]) :- assert(under_the_dome_AND_prison_break(-1,-1)).

generate_facts_under_the_dome_AND_prison_break([(Start,End) | Tail]) :- assert(under_the_dome_AND_prison_break(Start,End)), generate_facts_under_the_dome_AND_prison_break(Tail).

under_the_dome_AND_prison_break_aux() :- findall((Start,End),under_the_dome(Start,End),Interval1), findall((Start,End),prison_break(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_under_the_dome_AND_prison_break(Interval).

under_the_dome_AND_prison_break_at_2036(Res) :- setof((Start,End),under_the_dome_AND_prison_break(Start,End),AllINtervals), checkvalidity(2036,AllINtervals,Res).

check_query() :- write('Query = under_the_dome_AND_prison_break_at_2036'), (under_the_dome_AND_prison_break_at_2036(true) -> write('\nRes   = true');write('\nRes   = false')).
?- under_the_dome_AND_prison_break_aux().

