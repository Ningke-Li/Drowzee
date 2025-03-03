:- include('database.pl').
gilmore_girls(Start,End) :- begin('gilmore_girls',_,_,Start), end('gilmore_girls',_,_,End), Start=<End.

finally_gilmore_girls_during_7_11(Start,End) :- gilmore_girls(Start1,End1), (Start1-11)=<(End1-7), Start is (Start1-11), End is (End1-7), Start=<End.

globally_finally_gilmore_girls_during_7_11_during_1_11(Start,End) :- finally_gilmore_girls_during_7_11(Start1,End1), Start is (Start1-1), End is (End1-11), Start=<End.

globally_finally_gilmore_girls_during_7_11_during_1_11_at_2001(Res) :- setof((Start,End),globally_finally_gilmore_girls_during_7_11_during_1_11(Start,End),AllINtervals), checkvalidity(2001,AllINtervals,Res).

check_query() :- write('Query = globally_finally_gilmore_girls_during_7_11_during_1_11_at_2001'), (globally_finally_gilmore_girls_during_7_11_during_1_11_at_2001(true) -> write('\nRes   = true');write('\nRes   = false')).

