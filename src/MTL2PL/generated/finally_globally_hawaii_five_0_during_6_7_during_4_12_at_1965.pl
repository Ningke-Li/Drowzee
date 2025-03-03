:- include('database.pl').
hawaii_five_0(Start,End) :- begin('hawaii_five_0',_,_,Start), end('hawaii_five_0',_,_,End), Start=<End.

globally_hawaii_five_0_during_6_7(Start,End) :- hawaii_five_0(Start1,End1), Start is (Start1-6), End is (End1-7), Start=<End.

finally_globally_hawaii_five_0_during_6_7_during_4_12(Start,End) :- globally_hawaii_five_0_during_6_7(Start1,End1), (Start1-12)=<(End1-4), Start is (Start1-12), End is (End1-4), Start=<End.

finally_globally_hawaii_five_0_during_6_7_during_4_12_at_1965(Res) :- setof((Start,End),finally_globally_hawaii_five_0_during_6_7_during_4_12(Start,End),AllINtervals), checkvalidity(1965,AllINtervals,Res).

check_query() :- write('Query = finally_globally_hawaii_five_0_during_6_7_during_4_12_at_1965'), (finally_globally_hawaii_five_0_during_6_7_during_4_12_at_1965(true) -> write('\nRes   = true');write('\nRes   = false')).

