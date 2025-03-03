:- include('database.pl').
the_young_pope(Start,End) :- begin('the_young_pope',_,_,Start), end('the_young_pope',_,_,End), Start=<End.

paris_peace_conference(Start,End) :- begin('paris_peace_conference',_,_,Start), end('paris_peace_conference',_,_,End), Start=<End.

generate_facts_the_young_pope_OR_paris_peace_conference([]) :- assert(the_young_pope_OR_paris_peace_conference(-1,-1)).

generate_facts_the_young_pope_OR_paris_peace_conference([(Start,End) | Tail]) :- assert(the_young_pope_OR_paris_peace_conference(Start,End)), generate_facts_the_young_pope_OR_paris_peace_conference(Tail).

the_young_pope_OR_paris_peace_conference_aux() :- findall((Start,End),the_young_pope(Start,End),Interval1), findall((Start,End),paris_peace_conference(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_the_young_pope_OR_paris_peace_conference(Interval).

the_young_pope_OR_paris_peace_conference_at_1989(Res) :- setof((Start,End),the_young_pope_OR_paris_peace_conference(Start,End),AllINtervals), checkvalidity(1989,AllINtervals,Res).

check_query() :- write('Query = the_young_pope_OR_paris_peace_conference_at_1989'), (the_young_pope_OR_paris_peace_conference_at_1989(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_young_pope_OR_paris_peace_conference_aux().

