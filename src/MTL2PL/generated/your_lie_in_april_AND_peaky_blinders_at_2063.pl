:- include('database.pl').
your_lie_in_april(Start,End) :- begin('your_lie_in_april',_,_,Start), end('your_lie_in_april',_,_,End), Start=<End.

peaky_blinders(Start,End) :- begin('peaky_blinders',_,_,Start), end('peaky_blinders',_,_,End), Start=<End.

generate_facts_your_lie_in_april_AND_peaky_blinders([]) :- assert(your_lie_in_april_AND_peaky_blinders(-1,-1)).

generate_facts_your_lie_in_april_AND_peaky_blinders([(Start,End) | Tail]) :- assert(your_lie_in_april_AND_peaky_blinders(Start,End)), generate_facts_your_lie_in_april_AND_peaky_blinders(Tail).

your_lie_in_april_AND_peaky_blinders_aux() :- findall((Start,End),your_lie_in_april(Start,End),Interval1), findall((Start,End),peaky_blinders(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_your_lie_in_april_AND_peaky_blinders(Interval).

your_lie_in_april_AND_peaky_blinders_at_2063(Res) :- setof((Start,End),your_lie_in_april_AND_peaky_blinders(Start,End),AllINtervals), checkvalidity(2063,AllINtervals,Res).

check_query() :- write('Query = your_lie_in_april_AND_peaky_blinders_at_2063'), (your_lie_in_april_AND_peaky_blinders_at_2063(true) -> write('\nRes   = true');write('\nRes   = false')).
?- your_lie_in_april_AND_peaky_blinders_aux().

