:- include('database.pl').
scandal(Start,End) :- begin('scandal',_,_,Start), end('scandal',_,_,End), Start=<End.

big_little_lies(Start,End) :- begin('big_little_lies',_,_,Start), end('big_little_lies',_,_,End), Start=<End.

generate_facts_scandal_AND_big_little_lies([]) :- assert(scandal_AND_big_little_lies(-1,-1)).

generate_facts_scandal_AND_big_little_lies([(Start,End) | Tail]) :- assert(scandal_AND_big_little_lies(Start,End)), generate_facts_scandal_AND_big_little_lies(Tail).

scandal_AND_big_little_lies_aux() :- findall((Start,End),scandal(Start,End),Interval1), findall((Start,End),big_little_lies(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_scandal_AND_big_little_lies(Interval).

scandal_AND_big_little_lies_at_1944(Res) :- setof((Start,End),scandal_AND_big_little_lies(Start,End),AllINtervals), checkvalidity(1944,AllINtervals,Res).

check_query() :- write('Query = scandal_AND_big_little_lies_at_1944'), (scandal_AND_big_little_lies_at_1944(true) -> write('\nRes   = true');write('\nRes   = false')).
?- scandal_AND_big_little_lies_aux().

