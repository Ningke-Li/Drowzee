:- include('database.pl').
the_big_bang_theory(Start,End) :- begin('the_big_bang_theory',_,_,Start), end('the_big_bang_theory',_,_,End), Start=<End.

finally_the_big_bang_theory_during_1_19(Start,End) :- the_big_bang_theory(Start1,End1), (Start1-19)=<(End1-1), Start is (Start1-19), End is (End1-1), Start=<End.

finally_the_big_bang_theory_during_1_19_at_1992(Res) :- setof((Start,End),finally_the_big_bang_theory_during_1_19(Start,End),AllINtervals), checkvalidity(1992,AllINtervals,Res).

check_query() :- write('Query = finally_the_big_bang_theory_during_1_19_at_1992'), (finally_the_big_bang_theory_during_1_19_at_1992(true) -> write('\nRes   = true');write('\nRes   = false')).

