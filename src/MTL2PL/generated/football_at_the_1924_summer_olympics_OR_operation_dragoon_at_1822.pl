:- include('database.pl').
football_at_the_1924_summer_olympics(Start,End) :- begin('football_at_the_1924_summer_olympics',_,_,Start), end('football_at_the_1924_summer_olympics',_,_,End), Start=<End.

operation_dragoon(Start,End) :- begin('operation_dragoon',_,_,Start), end('operation_dragoon',_,_,End), Start=<End.

generate_facts_football_at_the_1924_summer_olympics_OR_operation_dragoon([]) :- assert(football_at_the_1924_summer_olympics_OR_operation_dragoon(-1,-1)).

generate_facts_football_at_the_1924_summer_olympics_OR_operation_dragoon([(Start,End) | Tail]) :- assert(football_at_the_1924_summer_olympics_OR_operation_dragoon(Start,End)), generate_facts_football_at_the_1924_summer_olympics_OR_operation_dragoon(Tail).

football_at_the_1924_summer_olympics_OR_operation_dragoon_aux() :- findall((Start,End),football_at_the_1924_summer_olympics(Start,End),Interval1), findall((Start,End),operation_dragoon(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_football_at_the_1924_summer_olympics_OR_operation_dragoon(Interval).

football_at_the_1924_summer_olympics_OR_operation_dragoon_at_1822(Res) :- setof((Start,End),football_at_the_1924_summer_olympics_OR_operation_dragoon(Start,End),AllINtervals), checkvalidity(1822,AllINtervals,Res).

check_query() :- write('Query = football_at_the_1924_summer_olympics_OR_operation_dragoon_at_1822'), (football_at_the_1924_summer_olympics_OR_operation_dragoon_at_1822(true) -> write('\nRes   = true');write('\nRes   = false')).
?- football_at_the_1924_summer_olympics_OR_operation_dragoon_aux().

