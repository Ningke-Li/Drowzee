:- include('database.pl').
dr__romantic(Start,End) :- begin('dr__romantic',_,_,Start), end('dr__romantic',_,_,End), Start=<End.

scandal(Start,End) :- begin('scandal',_,_,Start), end('scandal',_,_,End), Start=<End.

generate_facts_dr__romantic_AND_scandal([]) :- assert(dr__romantic_AND_scandal(-1,-1)).

generate_facts_dr__romantic_AND_scandal([(Start,End) | Tail]) :- assert(dr__romantic_AND_scandal(Start,End)), generate_facts_dr__romantic_AND_scandal(Tail).

dr__romantic_AND_scandal_aux() :- findall((Start,End),dr__romantic(Start,End),Interval1), findall((Start,End),scandal(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_dr__romantic_AND_scandal(Interval).

dr__romantic_AND_scandal_at_2016(Res) :- setof((Start,End),dr__romantic_AND_scandal(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = dr__romantic_AND_scandal_at_2016'), (dr__romantic_AND_scandal_at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).
?- dr__romantic_AND_scandal_aux().

