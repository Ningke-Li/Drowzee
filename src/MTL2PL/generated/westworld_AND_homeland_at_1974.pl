:- include('database.pl').
westworld(Start,End) :- begin('westworld',_,_,Start), end('westworld',_,_,End), Start=<End.

homeland(Start,End) :- begin('homeland',_,_,Start), end('homeland',_,_,End), Start=<End.

generate_facts_westworld_AND_homeland([]) :- assert(westworld_AND_homeland(-1,-1)).

generate_facts_westworld_AND_homeland([(Start,End) | Tail]) :- assert(westworld_AND_homeland(Start,End)), generate_facts_westworld_AND_homeland(Tail).

westworld_AND_homeland_aux() :- findall((Start,End),westworld(Start,End),Interval1), findall((Start,End),homeland(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_westworld_AND_homeland(Interval).

westworld_AND_homeland_at_1974(Res) :- setof((Start,End),westworld_AND_homeland(Start,End),AllINtervals), checkvalidity(1974,AllINtervals,Res).

check_query() :- write('Query = westworld_AND_homeland_at_1974'), (westworld_AND_homeland_at_1974(true) -> write('\nRes   = true');write('\nRes   = false')).
?- westworld_AND_homeland_aux().

