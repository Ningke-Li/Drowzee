:- include('database.pl').
keeping_up_with_the_kardashians(Start,End) :- begin('keeping_up_with_the_kardashians',_,_,Start), end('keeping_up_with_the_kardashians',_,_,End), Start=<End.

the_it_crowd(Start,End) :- begin('the_it_crowd',_,_,Start), end('the_it_crowd',_,_,End), Start=<End.

generate_facts_keeping_up_with_the_kardashians_AND_the_it_crowd([]) :- assert(keeping_up_with_the_kardashians_AND_the_it_crowd(-1,-1)).

generate_facts_keeping_up_with_the_kardashians_AND_the_it_crowd([(Start,End) | Tail]) :- assert(keeping_up_with_the_kardashians_AND_the_it_crowd(Start,End)), generate_facts_keeping_up_with_the_kardashians_AND_the_it_crowd(Tail).

keeping_up_with_the_kardashians_AND_the_it_crowd_aux() :- findall((Start,End),keeping_up_with_the_kardashians(Start,End),Interval1), findall((Start,End),the_it_crowd(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_keeping_up_with_the_kardashians_AND_the_it_crowd(Interval).

keeping_up_with_the_kardashians_AND_the_it_crowd_at_1923(Res) :- setof((Start,End),keeping_up_with_the_kardashians_AND_the_it_crowd(Start,End),AllINtervals), checkvalidity(1923,AllINtervals,Res).

check_query() :- write('Query = keeping_up_with_the_kardashians_AND_the_it_crowd_at_1923'), (keeping_up_with_the_kardashians_AND_the_it_crowd_at_1923(true) -> write('\nRes   = true');write('\nRes   = false')).
?- keeping_up_with_the_kardashians_AND_the_it_crowd_aux().

