:- include('database.pl').
reign(Start,End) :- begin('reign',_,_,Start), end('reign',_,_,End), Start=<End.

malayan_emergency(Start,End) :- begin('malayan_emergency',_,_,Start), end('malayan_emergency',_,_,End), Start=<End.

generate_facts_reign_OR_malayan_emergency([]) :- assert(reign_OR_malayan_emergency(-1,-1)).

generate_facts_reign_OR_malayan_emergency([(Start,End) | Tail]) :- assert(reign_OR_malayan_emergency(Start,End)), generate_facts_reign_OR_malayan_emergency(Tail).

reign_OR_malayan_emergency_aux() :- findall((Start,End),reign(Start,End),Interval1), findall((Start,End),malayan_emergency(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_reign_OR_malayan_emergency(Interval).

reign_OR_malayan_emergency_at_2040(Res) :- setof((Start,End),reign_OR_malayan_emergency(Start,End),AllINtervals), checkvalidity(2040,AllINtervals,Res).

check_query() :- write('Query = reign_OR_malayan_emergency_at_2040'), (reign_OR_malayan_emergency_at_2040(true) -> write('\nRes   = true');write('\nRes   = false')).
?- reign_OR_malayan_emergency_aux().

