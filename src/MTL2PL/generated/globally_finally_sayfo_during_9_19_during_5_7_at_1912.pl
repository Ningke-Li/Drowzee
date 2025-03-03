:- include('database.pl').
sayfo(Start,End) :- begin('sayfo',_,_,Start), end('sayfo',_,_,End), Start=<End.

finally_sayfo_during_9_19(Start,End) :- sayfo(Start1,End1), (Start1-19)=<(End1-9), Start is (Start1-19), End is (End1-9), Start=<End.

globally_finally_sayfo_during_9_19_during_5_7(Start,End) :- finally_sayfo_during_9_19(Start1,End1), Start is (Start1-5), End is (End1-7), Start=<End.

globally_finally_sayfo_during_9_19_during_5_7_at_1912(Res) :- setof((Start,End),globally_finally_sayfo_during_9_19_during_5_7(Start,End),AllINtervals), checkvalidity(1912,AllINtervals,Res).

check_query() :- write('Query = globally_finally_sayfo_during_9_19_during_5_7_at_1912'), (globally_finally_sayfo_during_9_19_during_5_7_at_1912(true) -> write('\nRes   = true');write('\nRes   = false')).

