:- include('database.pl').
the_good_wife(Start,End) :- begin('the_good_wife',_,_,Start), end('the_good_wife',_,_,End), Start=<End.

violetta(Start,End) :- begin('violetta',_,_,Start), end('violetta',_,_,End), Start=<End.

generate_facts_the_good_wife_AND_violetta([]) :- assert(the_good_wife_AND_violetta(-1,-1)).

generate_facts_the_good_wife_AND_violetta([(Start,End) | Tail]) :- assert(the_good_wife_AND_violetta(Start,End)), generate_facts_the_good_wife_AND_violetta(Tail).

the_good_wife_AND_violetta_aux() :- findall((Start,End),the_good_wife(Start,End),Interval1), findall((Start,End),violetta(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_good_wife_AND_violetta(Interval).

the_good_wife_AND_violetta_at_1934(Res) :- setof((Start,End),the_good_wife_AND_violetta(Start,End),AllINtervals), checkvalidity(1934,AllINtervals,Res).

check_query() :- write('Query = the_good_wife_AND_violetta_at_1934'), (the_good_wife_AND_violetta_at_1934(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_good_wife_AND_violetta_aux().

