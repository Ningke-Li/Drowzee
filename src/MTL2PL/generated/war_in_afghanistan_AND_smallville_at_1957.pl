:- include('database.pl').
war_in_afghanistan(Start,End) :- begin('war_in_afghanistan',_,_,Start), end('war_in_afghanistan',_,_,End), Start=<End.

smallville(Start,End) :- begin('smallville',_,_,Start), end('smallville',_,_,End), Start=<End.

generate_facts_war_in_afghanistan_AND_smallville([]) :- assert(war_in_afghanistan_AND_smallville(-1,-1)).

generate_facts_war_in_afghanistan_AND_smallville([(Start,End) | Tail]) :- assert(war_in_afghanistan_AND_smallville(Start,End)), generate_facts_war_in_afghanistan_AND_smallville(Tail).

war_in_afghanistan_AND_smallville_aux() :- findall((Start,End),war_in_afghanistan(Start,End),Interval1), findall((Start,End),smallville(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_war_in_afghanistan_AND_smallville(Interval).

war_in_afghanistan_AND_smallville_at_1957(Res) :- setof((Start,End),war_in_afghanistan_AND_smallville(Start,End),AllINtervals), checkvalidity(1957,AllINtervals,Res).

check_query() :- write('Query = war_in_afghanistan_AND_smallville_at_1957'), (war_in_afghanistan_AND_smallville_at_1957(true) -> write('\nRes   = true');write('\nRes   = false')).
?- war_in_afghanistan_AND_smallville_aux().

