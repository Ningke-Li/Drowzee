:- include('database.pl').
andromeda(Start,End) :- begin('andromeda',_,_,Start), end('andromeda',_,_,End), Start=<End.

finally_andromeda_during_1_14(Start,End) :- andromeda(Start1,End1), (Start1-14)=<(End1-1), Start is (Start1-14), End is (End1-1), Start=<End.

globally_finally_andromeda_during_1_14_during_3_15(Start,End) :- finally_andromeda_during_1_14(Start1,End1), Start is (Start1-3), End is (End1-15), Start=<End.

globally_finally_andromeda_during_1_14_during_3_15_at_1959(Res) :- setof((Start,End),globally_finally_andromeda_during_1_14_during_3_15(Start,End),AllINtervals), checkvalidity(1959,AllINtervals,Res).

check_query() :- write('Query = globally_finally_andromeda_during_1_14_during_3_15_at_1959'), (globally_finally_andromeda_during_1_14_during_3_15_at_1959(true) -> write('\nRes   = true');write('\nRes   = false')).

