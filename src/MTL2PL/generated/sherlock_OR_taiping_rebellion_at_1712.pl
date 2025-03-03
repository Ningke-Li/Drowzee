:- include('database.pl').
sherlock(Start,End) :- begin('sherlock',_,_,Start), end('sherlock',_,_,End), Start=<End.

taiping_rebellion(Start,End) :- begin('taiping_rebellion',_,_,Start), end('taiping_rebellion',_,_,End), Start=<End.

generate_facts_sherlock_OR_taiping_rebellion([]) :- assert(sherlock_OR_taiping_rebellion(-1,-1)).

generate_facts_sherlock_OR_taiping_rebellion([(Start,End) | Tail]) :- assert(sherlock_OR_taiping_rebellion(Start,End)), generate_facts_sherlock_OR_taiping_rebellion(Tail).

sherlock_OR_taiping_rebellion_aux() :- findall((Start,End),sherlock(Start,End),Interval1), findall((Start,End),taiping_rebellion(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_sherlock_OR_taiping_rebellion(Interval).

sherlock_OR_taiping_rebellion_at_1712(Res) :- setof((Start,End),sherlock_OR_taiping_rebellion(Start,End),AllINtervals), checkvalidity(1712,AllINtervals,Res).

check_query() :- write('Query = sherlock_OR_taiping_rebellion_at_1712'), (sherlock_OR_taiping_rebellion_at_1712(true) -> write('\nRes   = true');write('\nRes   = false')).
?- sherlock_OR_taiping_rebellion_aux().

