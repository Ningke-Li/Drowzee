:- include('database.pl').
tom_and_jerry(Start,End) :- begin('tom_and_jerry',_,_,Start), end('tom_and_jerry',_,_,End), Start=<End.

war_in_afghanistan(Start,End) :- begin('war_in_afghanistan',_,_,Start), end('war_in_afghanistan',_,_,End), Start=<End.

generate_facts_tom_and_jerry_OR_war_in_afghanistan([]) :- assert(tom_and_jerry_OR_war_in_afghanistan(-1,-1)).

generate_facts_tom_and_jerry_OR_war_in_afghanistan([(Start,End) | Tail]) :- assert(tom_and_jerry_OR_war_in_afghanistan(Start,End)), generate_facts_tom_and_jerry_OR_war_in_afghanistan(Tail).

tom_and_jerry_OR_war_in_afghanistan_aux() :- findall((Start,End),tom_and_jerry(Start,End),Interval1), findall((Start,End),war_in_afghanistan(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_tom_and_jerry_OR_war_in_afghanistan(Interval).

tom_and_jerry_OR_war_in_afghanistan_at_1853(Res) :- setof((Start,End),tom_and_jerry_OR_war_in_afghanistan(Start,End),AllINtervals), checkvalidity(1853,AllINtervals,Res).

check_query() :- write('Query = tom_and_jerry_OR_war_in_afghanistan_at_1853'), (tom_and_jerry_OR_war_in_afghanistan_at_1853(true) -> write('\nRes   = true');write('\nRes   = false')).
?- tom_and_jerry_OR_war_in_afghanistan_aux().

