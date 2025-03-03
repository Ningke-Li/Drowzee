:- include('database.pl').
homeland(Start,End) :- begin('homeland',_,_,Start), end('homeland',_,_,End), Start=<End.

luke_cage(Start,End) :- begin('luke_cage',_,_,Start), end('luke_cage',_,_,End), Start=<End.

generate_facts_homeland_AND_luke_cage([]) :- assert(homeland_AND_luke_cage(-1,-1)).

generate_facts_homeland_AND_luke_cage([(Start,End) | Tail]) :- assert(homeland_AND_luke_cage(Start,End)), generate_facts_homeland_AND_luke_cage(Tail).

homeland_AND_luke_cage_aux() :- findall((Start,End),homeland(Start,End),Interval1), findall((Start,End),luke_cage(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_homeland_AND_luke_cage(Interval).

homeland_AND_luke_cage_at_2067(Res) :- setof((Start,End),homeland_AND_luke_cage(Start,End),AllINtervals), checkvalidity(2067,AllINtervals,Res).

check_query() :- write('Query = homeland_AND_luke_cage_at_2067'), (homeland_AND_luke_cage_at_2067(true) -> write('\nRes   = true');write('\nRes   = false')).
?- homeland_AND_luke_cage_aux().

