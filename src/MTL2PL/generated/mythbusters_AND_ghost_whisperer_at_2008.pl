:- include('database.pl').
mythbusters(Start,End) :- begin('mythbusters',_,_,Start), end('mythbusters',_,_,End), Start=<End.

ghost_whisperer(Start,End) :- begin('ghost_whisperer',_,_,Start), end('ghost_whisperer',_,_,End), Start=<End.

generate_facts_mythbusters_AND_ghost_whisperer([]) :- assert(mythbusters_AND_ghost_whisperer(-1,-1)).

generate_facts_mythbusters_AND_ghost_whisperer([(Start,End) | Tail]) :- assert(mythbusters_AND_ghost_whisperer(Start,End)), generate_facts_mythbusters_AND_ghost_whisperer(Tail).

mythbusters_AND_ghost_whisperer_aux() :- findall((Start,End),mythbusters(Start,End),Interval1), findall((Start,End),ghost_whisperer(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_mythbusters_AND_ghost_whisperer(Interval).

mythbusters_AND_ghost_whisperer_at_2008(Res) :- setof((Start,End),mythbusters_AND_ghost_whisperer(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = mythbusters_AND_ghost_whisperer_at_2008'), (mythbusters_AND_ghost_whisperer_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).
?- mythbusters_AND_ghost_whisperer_aux().

