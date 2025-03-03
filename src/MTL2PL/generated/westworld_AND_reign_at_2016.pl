:- include('database.pl').
westworld(Start,End) :- begin('westworld',_,_,Start), end('westworld',_,_,End), Start=<End.

reign(Start,End) :- begin('reign',_,_,Start), end('reign',_,_,End), Start=<End.

generate_facts_westworld_AND_reign([]) :- assert(westworld_AND_reign(-1,-1)).

generate_facts_westworld_AND_reign([(Start,End) | Tail]) :- assert(westworld_AND_reign(Start,End)), generate_facts_westworld_AND_reign(Tail).

westworld_AND_reign_aux() :- findall((Start,End),westworld(Start,End),Interval1), findall((Start,End),reign(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_westworld_AND_reign(Interval).

westworld_AND_reign_at_2016(Res) :- setof((Start,End),westworld_AND_reign(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = westworld_AND_reign_at_2016'), (westworld_AND_reign_at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).
?- westworld_AND_reign_aux().

