:- include('database.pl').
nikita(Start,End) :- begin('nikita',_,_,Start), end('nikita',_,_,End), Start=<End.

johnny_test(Start,End) :- begin('johnny_test',_,_,Start), end('johnny_test',_,_,End), Start=<End.

generate_facts_nikita_AND_johnny_test([]) :- assert(nikita_AND_johnny_test(-1,-1)).

generate_facts_nikita_AND_johnny_test([(Start,End) | Tail]) :- assert(nikita_AND_johnny_test(Start,End)), generate_facts_nikita_AND_johnny_test(Tail).

nikita_AND_johnny_test_aux() :- findall((Start,End),nikita(Start,End),Interval1), findall((Start,End),johnny_test(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_nikita_AND_johnny_test(Interval).

nikita_AND_johnny_test_at_2011(Res) :- setof((Start,End),nikita_AND_johnny_test(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = nikita_AND_johnny_test_at_2011'), (nikita_AND_johnny_test_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).
?- nikita_AND_johnny_test_aux().

