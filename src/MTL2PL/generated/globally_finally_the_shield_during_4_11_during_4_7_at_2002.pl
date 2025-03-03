:- include('database.pl').
the_shield(Start,End) :- begin('the_shield',_,_,Start), end('the_shield',_,_,End), Start=<End.

finally_the_shield_during_4_11(Start,End) :- the_shield(Start1,End1), (Start1-11)=<(End1-4), Start is (Start1-11), End is (End1-4), Start=<End.

globally_finally_the_shield_during_4_11_during_4_7(Start,End) :- finally_the_shield_during_4_11(Start1,End1), Start is (Start1-4), End is (End1-7), Start=<End.

globally_finally_the_shield_during_4_11_during_4_7_at_2002(Res) :- setof((Start,End),globally_finally_the_shield_during_4_11_during_4_7(Start,End),AllINtervals), checkvalidity(2002,AllINtervals,Res).

check_query() :- write('Query = globally_finally_the_shield_during_4_11_during_4_7_at_2002'), (globally_finally_the_shield_during_4_11_during_4_7_at_2002(true) -> write('\nRes   = true');write('\nRes   = false')).

