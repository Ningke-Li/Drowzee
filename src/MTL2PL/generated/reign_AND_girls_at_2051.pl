:- include('database.pl').
reign(Start,End) :- begin('reign',_,_,Start), end('reign',_,_,End), Start=<End.

girls(Start,End) :- begin('girls',_,_,Start), end('girls',_,_,End), Start=<End.

generate_facts_reign_AND_girls([]) :- assert(reign_AND_girls(-1,-1)).

generate_facts_reign_AND_girls([(Start,End) | Tail]) :- assert(reign_AND_girls(Start,End)), generate_facts_reign_AND_girls(Tail).

reign_AND_girls_aux() :- findall((Start,End),reign(Start,End),Interval1), findall((Start,End),girls(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_reign_AND_girls(Interval).

reign_AND_girls_at_2051(Res) :- setof((Start,End),reign_AND_girls(Start,End),AllINtervals), checkvalidity(2051,AllINtervals,Res).

check_query() :- write('Query = reign_AND_girls_at_2051'), (reign_AND_girls_at_2051(true) -> write('\nRes   = true');write('\nRes   = false')).
?- reign_AND_girls_aux().

