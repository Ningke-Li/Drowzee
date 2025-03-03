:- include('database.pl').
magnificent_century(Start,End) :- begin('magnificent_century',_,_,Start), end('magnificent_century',_,_,End), Start=<End.

globally_magnificent_century_during_2_3(Start,End) :- magnificent_century(Start1,End1), Start is (Start1-2), End is (End1-3), Start=<End.

finally_globally_magnificent_century_during_2_3_during_8_17(Start,End) :- globally_magnificent_century_during_2_3(Start1,End1), (Start1-17)=<(End1-8), Start is (Start1-17), End is (End1-8), Start=<End.

finally_globally_magnificent_century_during_2_3_during_8_17_at_1860(Res) :- setof((Start,End),finally_globally_magnificent_century_during_2_3_during_8_17(Start,End),AllINtervals), checkvalidity(1860,AllINtervals,Res).

check_query() :- write('Query = finally_globally_magnificent_century_during_2_3_during_8_17_at_1860'), (finally_globally_magnificent_century_during_2_3_during_8_17_at_1860(true) -> write('\nRes   = true');write('\nRes   = false')).

