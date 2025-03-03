:- include('database.pl').
suits(Start,End) :- begin('suits',_,_,Start), end('suits',_,_,End), Start=<End.

the_big_bang_theory(Start,End) :- begin('the_big_bang_theory',_,_,Start), end('the_big_bang_theory',_,_,End), Start=<End.

generate_facts_suits_AND_the_big_bang_theory([]) :- assert(suits_AND_the_big_bang_theory(-1,-1)).

generate_facts_suits_AND_the_big_bang_theory([(Start,End) | Tail]) :- assert(suits_AND_the_big_bang_theory(Start,End)), generate_facts_suits_AND_the_big_bang_theory(Tail).

suits_AND_the_big_bang_theory_aux() :- findall((Start,End),suits(Start,End),Interval1), findall((Start,End),the_big_bang_theory(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_suits_AND_the_big_bang_theory(Interval).

suits_AND_the_big_bang_theory_at_1936(Res) :- setof((Start,End),suits_AND_the_big_bang_theory(Start,End),AllINtervals), checkvalidity(1936,AllINtervals,Res).

check_query() :- write('Query = suits_AND_the_big_bang_theory_at_1936'), (suits_AND_the_big_bang_theory_at_1936(true) -> write('\nRes   = true');write('\nRes   = false')).
?- suits_AND_the_big_bang_theory_aux().

