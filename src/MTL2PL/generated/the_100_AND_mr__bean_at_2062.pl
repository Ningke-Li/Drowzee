:- include('database.pl').
the_100(Start,End) :- begin('the_100',_,_,Start), end('the_100',_,_,End), Start=<End.

mr__bean(Start,End) :- begin('mr__bean',_,_,Start), end('mr__bean',_,_,End), Start=<End.

generate_facts_the_100_AND_mr__bean([]) :- assert(the_100_AND_mr__bean(-1,-1)).

generate_facts_the_100_AND_mr__bean([(Start,End) | Tail]) :- assert(the_100_AND_mr__bean(Start,End)), generate_facts_the_100_AND_mr__bean(Tail).

the_100_AND_mr__bean_aux() :- findall((Start,End),the_100(Start,End),Interval1), findall((Start,End),mr__bean(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_100_AND_mr__bean(Interval).

the_100_AND_mr__bean_at_2062(Res) :- setof((Start,End),the_100_AND_mr__bean(Start,End),AllINtervals), checkvalidity(2062,AllINtervals,Res).

check_query() :- write('Query = the_100_AND_mr__bean_at_2062'), (the_100_AND_mr__bean_at_2062(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_100_AND_mr__bean_aux().

