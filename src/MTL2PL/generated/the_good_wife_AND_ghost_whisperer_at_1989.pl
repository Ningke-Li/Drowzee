:- include('database.pl').
the_good_wife(Start,End) :- begin('the_good_wife',_,_,Start), end('the_good_wife',_,_,End), Start=<End.

ghost_whisperer(Start,End) :- begin('ghost_whisperer',_,_,Start), end('ghost_whisperer',_,_,End), Start=<End.

generate_facts_the_good_wife_AND_ghost_whisperer([]) :- assert(the_good_wife_AND_ghost_whisperer(-1,-1)).

generate_facts_the_good_wife_AND_ghost_whisperer([(Start,End) | Tail]) :- assert(the_good_wife_AND_ghost_whisperer(Start,End)), generate_facts_the_good_wife_AND_ghost_whisperer(Tail).

the_good_wife_AND_ghost_whisperer_aux() :- findall((Start,End),the_good_wife(Start,End),Interval1), findall((Start,End),ghost_whisperer(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_good_wife_AND_ghost_whisperer(Interval).

the_good_wife_AND_ghost_whisperer_at_1989(Res) :- setof((Start,End),the_good_wife_AND_ghost_whisperer(Start,End),AllINtervals), checkvalidity(1989,AllINtervals,Res).

check_query() :- write('Query = the_good_wife_AND_ghost_whisperer_at_1989'), (the_good_wife_AND_ghost_whisperer_at_1989(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_good_wife_AND_ghost_whisperer_aux().

