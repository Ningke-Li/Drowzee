:- include('database.pl').
east_german_mark(Start,End) :- begin('east_german_mark',_,_,Start), end('east_german_mark',_,_,End), Start=<End.

woody_woodpecker(Start,End) :- begin('woody_woodpecker',_,_,Start), end('woody_woodpecker',_,_,End), Start=<End.

generate_facts_east_german_mark_AND_woody_woodpecker([]) :- assert(east_german_mark_AND_woody_woodpecker(-1,-1)).

generate_facts_east_german_mark_AND_woody_woodpecker([(Start,End) | Tail]) :- assert(east_german_mark_AND_woody_woodpecker(Start,End)), generate_facts_east_german_mark_AND_woody_woodpecker(Tail).

east_german_mark_AND_woody_woodpecker_aux() :- findall((Start,End),east_german_mark(Start,End),Interval1), findall((Start,End),woody_woodpecker(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_east_german_mark_AND_woody_woodpecker(Interval).

east_german_mark_AND_woody_woodpecker_at_1923(Res) :- setof((Start,End),east_german_mark_AND_woody_woodpecker(Start,End),AllINtervals), checkvalidity(1923,AllINtervals,Res).

check_query() :- write('Query = east_german_mark_AND_woody_woodpecker_at_1923'), (east_german_mark_AND_woody_woodpecker_at_1923(true) -> write('\nRes   = true');write('\nRes   = false')).
?- east_german_mark_AND_woody_woodpecker_aux().

