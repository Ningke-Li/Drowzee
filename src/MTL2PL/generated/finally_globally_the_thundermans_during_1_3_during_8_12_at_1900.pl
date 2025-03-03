:- include('database.pl').
the_thundermans(Start,End) :- begin('the_thundermans',_,_,Start), end('the_thundermans',_,_,End), Start=<End.

globally_the_thundermans_during_1_3(Start,End) :- the_thundermans(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

finally_globally_the_thundermans_during_1_3_during_8_12(Start,End) :- globally_the_thundermans_during_1_3(Start1,End1), (Start1-12)=<(End1-8), Start is (Start1-12), End is (End1-8), Start=<End.

finally_globally_the_thundermans_during_1_3_during_8_12_at_1900(Res) :- setof((Start,End),finally_globally_the_thundermans_during_1_3_during_8_12(Start,End),AllINtervals), checkvalidity(1900,AllINtervals,Res).

check_query() :- write('Query = finally_globally_the_thundermans_during_1_3_during_8_12_at_1900'), (finally_globally_the_thundermans_during_1_3_during_8_12_at_1900(true) -> write('\nRes   = true');write('\nRes   = false')).

