:- include('database.pl').
o_clone(Start,End) :- begin('o_clone',_,_,Start), end('o_clone',_,_,End), Start=<End.

french_franc(Start,End) :- begin('french_franc',_,_,Start), end('french_franc',_,_,End), Start=<End.

generate_facts_o_clone_AND_french_franc([]) :- assert(o_clone_AND_french_franc(-1,-1)).

generate_facts_o_clone_AND_french_franc([(Start,End) | Tail]) :- assert(o_clone_AND_french_franc(Start,End)), generate_facts_o_clone_AND_french_franc(Tail).

o_clone_AND_french_franc_aux() :- findall((Start,End),o_clone(Start,End),Interval1), findall((Start,End),french_franc(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_o_clone_AND_french_franc(Interval).

o_clone_AND_french_franc_at_2001(Res) :- setof((Start,End),o_clone_AND_french_franc(Start,End),AllINtervals), checkvalidity(2001,AllINtervals,Res).

check_query() :- write('Query = o_clone_AND_french_franc_at_2001'), (o_clone_AND_french_franc_at_2001(true) -> write('\nRes   = true');write('\nRes   = false')).
?- o_clone_AND_french_franc_aux().

