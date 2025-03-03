:- include('database.pl').
sack_of_rome__1527(Start,End) :- begin('sack_of_rome__1527',_,_,Start), end('sack_of_rome__1527',_,_,End), Start=<End.

rome(Start,End) :- begin('rome',_,_,Start), end('rome',_,_,End), Start=<End.

generate_facts_sack_of_rome__1527_OR_rome([]) :- assert(sack_of_rome__1527_OR_rome(-1,-1)).

generate_facts_sack_of_rome__1527_OR_rome([(Start,End) | Tail]) :- assert(sack_of_rome__1527_OR_rome(Start,End)), generate_facts_sack_of_rome__1527_OR_rome(Tail).

sack_of_rome__1527_OR_rome_aux() :- findall((Start,End),sack_of_rome__1527(Start,End),Interval1), findall((Start,End),rome(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_sack_of_rome__1527_OR_rome(Interval).

sack_of_rome__1527_OR_rome_at_2005(Res) :- setof((Start,End),sack_of_rome__1527_OR_rome(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = sack_of_rome__1527_OR_rome_at_2005'), (sack_of_rome__1527_OR_rome_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).
?- sack_of_rome__1527_OR_rome_aux().

