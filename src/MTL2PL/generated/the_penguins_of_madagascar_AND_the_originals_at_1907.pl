:- include('database.pl').
the_penguins_of_madagascar(Start,End) :- begin('the_penguins_of_madagascar',_,_,Start), end('the_penguins_of_madagascar',_,_,End), Start=<End.

the_originals(Start,End) :- begin('the_originals',_,_,Start), end('the_originals',_,_,End), Start=<End.

generate_facts_the_penguins_of_madagascar_AND_the_originals([]) :- assert(the_penguins_of_madagascar_AND_the_originals(-1,-1)).

generate_facts_the_penguins_of_madagascar_AND_the_originals([(Start,End) | Tail]) :- assert(the_penguins_of_madagascar_AND_the_originals(Start,End)), generate_facts_the_penguins_of_madagascar_AND_the_originals(Tail).

the_penguins_of_madagascar_AND_the_originals_aux() :- findall((Start,End),the_penguins_of_madagascar(Start,End),Interval1), findall((Start,End),the_originals(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_penguins_of_madagascar_AND_the_originals(Interval).

the_penguins_of_madagascar_AND_the_originals_at_1907(Res) :- setof((Start,End),the_penguins_of_madagascar_AND_the_originals(Start,End),AllINtervals), checkvalidity(1907,AllINtervals,Res).

check_query() :- write('Query = the_penguins_of_madagascar_AND_the_originals_at_1907'), (the_penguins_of_madagascar_AND_the_originals_at_1907(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_penguins_of_madagascar_AND_the_originals_aux().

