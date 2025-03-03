:- include('database.pl').
top_gear(Start,End) :- begin('top_gear',_,_,Start), end('top_gear',_,_,End), Start=<End.

the_originals(Start,End) :- begin('the_originals',_,_,Start), end('the_originals',_,_,End), Start=<End.

generate_facts_top_gear_AND_the_originals([]) :- assert(top_gear_AND_the_originals(-1,-1)).

generate_facts_top_gear_AND_the_originals([(Start,End) | Tail]) :- assert(top_gear_AND_the_originals(Start,End)), generate_facts_top_gear_AND_the_originals(Tail).

top_gear_AND_the_originals_aux() :- findall((Start,End),top_gear(Start,End),Interval1), findall((Start,End),the_originals(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_top_gear_AND_the_originals(Interval).

top_gear_AND_the_originals_at_2014(Res) :- setof((Start,End),top_gear_AND_the_originals(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = top_gear_AND_the_originals_at_2014'), (top_gear_AND_the_originals_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).
?- top_gear_AND_the_originals_aux().

