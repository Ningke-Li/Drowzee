:- include('database.pl').
six_feet_under(Start,End) :- begin('six_feet_under',_,_,Start), end('six_feet_under',_,_,End), Start=<End.

assassination_classroom(Start,End) :- begin('assassination_classroom',_,_,Start), end('assassination_classroom',_,_,End), Start=<End.

generate_facts_six_feet_under_OR_assassination_classroom([]) :- assert(six_feet_under_OR_assassination_classroom(-1,-1)).

generate_facts_six_feet_under_OR_assassination_classroom([(Start,End) | Tail]) :- assert(six_feet_under_OR_assassination_classroom(Start,End)), generate_facts_six_feet_under_OR_assassination_classroom(Tail).

six_feet_under_OR_assassination_classroom_aux() :- findall((Start,End),six_feet_under(Start,End),Interval1), findall((Start,End),assassination_classroom(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_six_feet_under_OR_assassination_classroom(Interval).

six_feet_under_OR_assassination_classroom_at_2008(Res) :- setof((Start,End),six_feet_under_OR_assassination_classroom(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = six_feet_under_OR_assassination_classroom_at_2008'), (six_feet_under_OR_assassination_classroom_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).
?- six_feet_under_OR_assassination_classroom_aux().

