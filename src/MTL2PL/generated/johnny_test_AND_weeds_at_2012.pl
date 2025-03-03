:- include('database.pl').
johnny_test(Start,End) :- begin('johnny_test',_,_,Start), end('johnny_test',_,_,End), Start=<End.

weeds(Start,End) :- begin('weeds',_,_,Start), end('weeds',_,_,End), Start=<End.

generate_facts_johnny_test_AND_weeds([]) :- assert(johnny_test_AND_weeds(-1,-1)).

generate_facts_johnny_test_AND_weeds([(Start,End) | Tail]) :- assert(johnny_test_AND_weeds(Start,End)), generate_facts_johnny_test_AND_weeds(Tail).

johnny_test_AND_weeds_aux() :- findall((Start,End),johnny_test(Start,End),Interval1), findall((Start,End),weeds(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_johnny_test_AND_weeds(Interval).

johnny_test_AND_weeds_at_2012(Res) :- setof((Start,End),johnny_test_AND_weeds(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = johnny_test_AND_weeds_at_2012'), (johnny_test_AND_weeds_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).
?- johnny_test_AND_weeds_aux().

