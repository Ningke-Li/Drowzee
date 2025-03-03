:- include('database.pl').
reign(Start,End) :- begin('reign',_,_,Start), end('reign',_,_,End), Start=<End.

endless_love(Start,End) :- begin('endless_love',_,_,Start), end('endless_love',_,_,End), Start=<End.

generate_facts_reign_AND_endless_love([]) :- assert(reign_AND_endless_love(-1,-1)).

generate_facts_reign_AND_endless_love([(Start,End) | Tail]) :- assert(reign_AND_endless_love(Start,End)), generate_facts_reign_AND_endless_love(Tail).

reign_AND_endless_love_aux() :- findall((Start,End),reign(Start,End),Interval1), findall((Start,End),endless_love(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_reign_AND_endless_love(Interval).

reign_AND_endless_love_at_1918(Res) :- setof((Start,End),reign_AND_endless_love(Start,End),AllINtervals), checkvalidity(1918,AllINtervals,Res).

check_query() :- write('Query = reign_AND_endless_love_at_1918'), (reign_AND_endless_love_at_1918(true) -> write('\nRes   = true');write('\nRes   = false')).
?- reign_AND_endless_love_aux().

