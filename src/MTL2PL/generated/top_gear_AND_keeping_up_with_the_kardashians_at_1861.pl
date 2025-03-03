:- include('database.pl').
top_gear(Start,End) :- begin('top_gear',_,_,Start), end('top_gear',_,_,End), Start=<End.

keeping_up_with_the_kardashians(Start,End) :- begin('keeping_up_with_the_kardashians',_,_,Start), end('keeping_up_with_the_kardashians',_,_,End), Start=<End.

generate_facts_top_gear_AND_keeping_up_with_the_kardashians([]) :- assert(top_gear_AND_keeping_up_with_the_kardashians(-1,-1)).

generate_facts_top_gear_AND_keeping_up_with_the_kardashians([(Start,End) | Tail]) :- assert(top_gear_AND_keeping_up_with_the_kardashians(Start,End)), generate_facts_top_gear_AND_keeping_up_with_the_kardashians(Tail).

top_gear_AND_keeping_up_with_the_kardashians_aux() :- findall((Start,End),top_gear(Start,End),Interval1), findall((Start,End),keeping_up_with_the_kardashians(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_top_gear_AND_keeping_up_with_the_kardashians(Interval).

top_gear_AND_keeping_up_with_the_kardashians_at_1861(Res) :- setof((Start,End),top_gear_AND_keeping_up_with_the_kardashians(Start,End),AllINtervals), checkvalidity(1861,AllINtervals,Res).

check_query() :- write('Query = top_gear_AND_keeping_up_with_the_kardashians_at_1861'), (top_gear_AND_keeping_up_with_the_kardashians_at_1861(true) -> write('\nRes   = true');write('\nRes   = false')).
?- top_gear_AND_keeping_up_with_the_kardashians_aux().

