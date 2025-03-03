:- include('database.pl').
glee(Start,End) :- begin('glee',_,_,Start), end('glee',_,_,End), Start=<End.

the_big_bang_theory(Start,End) :- begin('the_big_bang_theory',_,_,Start), end('the_big_bang_theory',_,_,End), Start=<End.

generate_facts_glee_AND_the_big_bang_theory([]) :- assert(glee_AND_the_big_bang_theory(-1,-1)).

generate_facts_glee_AND_the_big_bang_theory([(Start,End) | Tail]) :- assert(glee_AND_the_big_bang_theory(Start,End)), generate_facts_glee_AND_the_big_bang_theory(Tail).

glee_AND_the_big_bang_theory_aux() :- findall((Start,End),glee(Start,End),Interval1), findall((Start,End),the_big_bang_theory(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_glee_AND_the_big_bang_theory(Interval).

glee_AND_the_big_bang_theory_at_2013(Res) :- setof((Start,End),glee_AND_the_big_bang_theory(Start,End),AllINtervals), checkvalidity(2013,AllINtervals,Res).

check_query() :- write('Query = glee_AND_the_big_bang_theory_at_2013'), (glee_AND_the_big_bang_theory_at_2013(true) -> write('\nRes   = true');write('\nRes   = false')).
?- glee_AND_the_big_bang_theory_aux().

