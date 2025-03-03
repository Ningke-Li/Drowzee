:- include('database.pl').
under_the_dome(Start,End) :- begin('under_the_dome',_,_,Start), end('under_the_dome',_,_,End), Start=<End.

juncker_commission(Start,End) :- begin('juncker_commission',_,_,Start), end('juncker_commission',_,_,End), Start=<End.

generate_facts_under_the_dome_AND_juncker_commission([]) :- assert(under_the_dome_AND_juncker_commission(-1,-1)).

generate_facts_under_the_dome_AND_juncker_commission([(Start,End) | Tail]) :- assert(under_the_dome_AND_juncker_commission(Start,End)), generate_facts_under_the_dome_AND_juncker_commission(Tail).

under_the_dome_AND_juncker_commission_aux() :- findall((Start,End),under_the_dome(Start,End),Interval1), findall((Start,End),juncker_commission(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_under_the_dome_AND_juncker_commission(Interval).

under_the_dome_AND_juncker_commission_at_2014(Res) :- setof((Start,End),under_the_dome_AND_juncker_commission(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = under_the_dome_AND_juncker_commission_at_2014'), (under_the_dome_AND_juncker_commission_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).
?- under_the_dome_AND_juncker_commission_aux().

