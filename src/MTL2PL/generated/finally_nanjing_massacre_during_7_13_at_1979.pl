:- include('database.pl').
nanjing_massacre(Start,End) :- begin('nanjing_massacre',_,_,Start), end('nanjing_massacre',_,_,End), Start=<End.

finally_nanjing_massacre_during_7_13(Start,End) :- nanjing_massacre(Start1,End1), (Start1-13)=<(End1-7), Start is (Start1-13), End is (End1-7), Start=<End.

finally_nanjing_massacre_during_7_13_at_1979(Res) :- setof((Start,End),finally_nanjing_massacre_during_7_13(Start,End),AllINtervals), checkvalidity(1979,AllINtervals,Res).

check_query() :- write('Query = finally_nanjing_massacre_during_7_13_at_1979'), (finally_nanjing_massacre_during_7_13_at_1979(true) -> write('\nRes   = true');write('\nRes   = false')).

