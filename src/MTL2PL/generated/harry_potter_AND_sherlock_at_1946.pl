:- include('database.pl').
harry_potter(Start,End) :- begin('harry_potter',_,_,Start), end('harry_potter',_,_,End), Start=<End.

sherlock(Start,End) :- begin('sherlock',_,_,Start), end('sherlock',_,_,End), Start=<End.

generate_facts_harry_potter_AND_sherlock([]) :- assert(harry_potter_AND_sherlock(-1,-1)).

generate_facts_harry_potter_AND_sherlock([(Start,End) | Tail]) :- assert(harry_potter_AND_sherlock(Start,End)), generate_facts_harry_potter_AND_sherlock(Tail).

harry_potter_AND_sherlock_aux() :- findall((Start,End),harry_potter(Start,End),Interval1), findall((Start,End),sherlock(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_harry_potter_AND_sherlock(Interval).

harry_potter_AND_sherlock_at_1946(Res) :- setof((Start,End),harry_potter_AND_sherlock(Start,End),AllINtervals), checkvalidity(1946,AllINtervals,Res).

check_query() :- write('Query = harry_potter_AND_sherlock_at_1946'), (harry_potter_AND_sherlock_at_1946(true) -> write('\nRes   = true');write('\nRes   = false')).
?- harry_potter_AND_sherlock_aux().

