:- include('database.pl').
totally_spies_(Start,End) :- begin('totally_spies_',_,_,Start), end('totally_spies_',_,_,End), Start=<End.

keeping_up_with_the_kardashians(Start,End) :- begin('keeping_up_with_the_kardashians',_,_,Start), end('keeping_up_with_the_kardashians',_,_,End), Start=<End.

generate_facts_totally_spies__AND_keeping_up_with_the_kardashians([]) :- assert(totally_spies__AND_keeping_up_with_the_kardashians(-1,-1)).

generate_facts_totally_spies__AND_keeping_up_with_the_kardashians([(Start,End) | Tail]) :- assert(totally_spies__AND_keeping_up_with_the_kardashians(Start,End)), generate_facts_totally_spies__AND_keeping_up_with_the_kardashians(Tail).

totally_spies__AND_keeping_up_with_the_kardashians_aux() :- findall((Start,End),totally_spies_(Start,End),Interval1), findall((Start,End),keeping_up_with_the_kardashians(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_totally_spies__AND_keeping_up_with_the_kardashians(Interval).

totally_spies__AND_keeping_up_with_the_kardashians_at_2012(Res) :- setof((Start,End),totally_spies__AND_keeping_up_with_the_kardashians(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = totally_spies__AND_keeping_up_with_the_kardashians_at_2012'), (totally_spies__AND_keeping_up_with_the_kardashians_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).
?- totally_spies__AND_keeping_up_with_the_kardashians_aux().

