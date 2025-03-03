:- include('database.pl').
annoying_orange(Start,End) :- begin('annoying_orange',_,_,Start), end('annoying_orange',_,_,End), Start=<End.

ghost_whisperer(Start,End) :- begin('ghost_whisperer',_,_,Start), end('ghost_whisperer',_,_,End), Start=<End.

generate_facts_annoying_orange_AND_ghost_whisperer([]) :- assert(annoying_orange_AND_ghost_whisperer(-1,-1)).

generate_facts_annoying_orange_AND_ghost_whisperer([(Start,End) | Tail]) :- assert(annoying_orange_AND_ghost_whisperer(Start,End)), generate_facts_annoying_orange_AND_ghost_whisperer(Tail).

annoying_orange_AND_ghost_whisperer_aux() :- findall((Start,End),annoying_orange(Start,End),Interval1), findall((Start,End),ghost_whisperer(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_annoying_orange_AND_ghost_whisperer(Interval).

annoying_orange_AND_ghost_whisperer_at_1949(Res) :- setof((Start,End),annoying_orange_AND_ghost_whisperer(Start,End),AllINtervals), checkvalidity(1949,AllINtervals,Res).

check_query() :- write('Query = annoying_orange_AND_ghost_whisperer_at_1949'), (annoying_orange_AND_ghost_whisperer_at_1949(true) -> write('\nRes   = true');write('\nRes   = false')).
?- annoying_orange_AND_ghost_whisperer_aux().

