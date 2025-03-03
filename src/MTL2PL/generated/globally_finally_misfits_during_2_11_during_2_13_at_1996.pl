:- include('database.pl').
misfits(Start,End) :- begin('misfits',_,_,Start), end('misfits',_,_,End), Start=<End.

finally_misfits_during_2_11(Start,End) :- misfits(Start1,End1), (Start1-11)=<(End1-2), Start is (Start1-11), End is (End1-2), Start=<End.

globally_finally_misfits_during_2_11_during_2_13(Start,End) :- finally_misfits_during_2_11(Start1,End1), Start is (Start1-2), End is (End1-13), Start=<End.

globally_finally_misfits_during_2_11_during_2_13_at_1996(Res) :- setof((Start,End),globally_finally_misfits_during_2_11_during_2_13(Start,End),AllINtervals), checkvalidity(1996,AllINtervals,Res).

check_query() :- write('Query = globally_finally_misfits_during_2_11_during_2_13_at_1996'), (globally_finally_misfits_during_2_11_during_2_13_at_1996(true) -> write('\nRes   = true');write('\nRes   = false')).

