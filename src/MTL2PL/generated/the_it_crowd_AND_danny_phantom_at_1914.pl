:- include('database.pl').
the_it_crowd(Start,End) :- begin('the_it_crowd',_,_,Start), end('the_it_crowd',_,_,End), Start=<End.

danny_phantom(Start,End) :- begin('danny_phantom',_,_,Start), end('danny_phantom',_,_,End), Start=<End.

generate_facts_the_it_crowd_AND_danny_phantom([]) :- assert(the_it_crowd_AND_danny_phantom(-1,-1)).

generate_facts_the_it_crowd_AND_danny_phantom([(Start,End) | Tail]) :- assert(the_it_crowd_AND_danny_phantom(Start,End)), generate_facts_the_it_crowd_AND_danny_phantom(Tail).

the_it_crowd_AND_danny_phantom_aux() :- findall((Start,End),the_it_crowd(Start,End),Interval1), findall((Start,End),danny_phantom(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_it_crowd_AND_danny_phantom(Interval).

the_it_crowd_AND_danny_phantom_at_1914(Res) :- setof((Start,End),the_it_crowd_AND_danny_phantom(Start,End),AllINtervals), checkvalidity(1914,AllINtervals,Res).

check_query() :- write('Query = the_it_crowd_AND_danny_phantom_at_1914'), (the_it_crowd_AND_danny_phantom_at_1914(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_it_crowd_AND_danny_phantom_aux().

