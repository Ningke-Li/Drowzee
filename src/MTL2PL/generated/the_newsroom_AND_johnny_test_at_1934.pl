:- include('database.pl').
the_newsroom(Start,End) :- begin('the_newsroom',_,_,Start), end('the_newsroom',_,_,End), Start=<End.

johnny_test(Start,End) :- begin('johnny_test',_,_,Start), end('johnny_test',_,_,End), Start=<End.

generate_facts_the_newsroom_AND_johnny_test([]) :- assert(the_newsroom_AND_johnny_test(-1,-1)).

generate_facts_the_newsroom_AND_johnny_test([(Start,End) | Tail]) :- assert(the_newsroom_AND_johnny_test(Start,End)), generate_facts_the_newsroom_AND_johnny_test(Tail).

the_newsroom_AND_johnny_test_aux() :- findall((Start,End),the_newsroom(Start,End),Interval1), findall((Start,End),johnny_test(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_newsroom_AND_johnny_test(Interval).

the_newsroom_AND_johnny_test_at_1934(Res) :- setof((Start,End),the_newsroom_AND_johnny_test(Start,End),AllINtervals), checkvalidity(1934,AllINtervals,Res).

check_query() :- write('Query = the_newsroom_AND_johnny_test_at_1934'), (the_newsroom_AND_johnny_test_at_1934(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_newsroom_AND_johnny_test_aux().

