:- include('database.pl').
the_big_bang_theory(Start,End) :- begin('the_big_bang_theory',_,_,Start), end('the_big_bang_theory',_,_,End), Start=<End.

globally_the_big_bang_theory_during_2_11(Start,End) :- the_big_bang_theory(Start1,End1), Start is (Start1-2), End is (End1-11), Start=<End.

globally_the_big_bang_theory_during_2_11_at_1877(Res) :- setof((Start,End),globally_the_big_bang_theory_during_2_11(Start,End),AllINtervals), checkvalidity(1877,AllINtervals,Res).

check_query() :- write('Query = globally_the_big_bang_theory_during_2_11_at_1877'), (globally_the_big_bang_theory_during_2_11_at_1877(true) -> write('\nRes   = true');write('\nRes   = false')).

