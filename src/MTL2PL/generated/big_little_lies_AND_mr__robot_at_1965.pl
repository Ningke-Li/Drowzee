:- include('database.pl').
big_little_lies(Start,End) :- begin('big_little_lies',_,_,Start), end('big_little_lies',_,_,End), Start=<End.

mr__robot(Start,End) :- begin('mr__robot',_,_,Start), end('mr__robot',_,_,End), Start=<End.

generate_facts_big_little_lies_AND_mr__robot([]) :- assert(big_little_lies_AND_mr__robot(-1,-1)).

generate_facts_big_little_lies_AND_mr__robot([(Start,End) | Tail]) :- assert(big_little_lies_AND_mr__robot(Start,End)), generate_facts_big_little_lies_AND_mr__robot(Tail).

big_little_lies_AND_mr__robot_aux() :- findall((Start,End),big_little_lies(Start,End),Interval1), findall((Start,End),mr__robot(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_big_little_lies_AND_mr__robot(Interval).

big_little_lies_AND_mr__robot_at_1965(Res) :- setof((Start,End),big_little_lies_AND_mr__robot(Start,End),AllINtervals), checkvalidity(1965,AllINtervals,Res).

check_query() :- write('Query = big_little_lies_AND_mr__robot_at_1965'), (big_little_lies_AND_mr__robot_at_1965(true) -> write('\nRes   = true');write('\nRes   = false')).
?- big_little_lies_AND_mr__robot_aux().

