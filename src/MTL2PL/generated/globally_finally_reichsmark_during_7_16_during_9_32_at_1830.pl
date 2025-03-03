:- include('database.pl').
reichsmark(Start,End) :- begin('reichsmark',_,_,Start), end('reichsmark',_,_,End), Start=<End.

finally_reichsmark_during_7_16(Start,End) :- reichsmark(Start1,End1), (Start1-16)=<(End1-7), Start is (Start1-16), End is (End1-7), Start=<End.

globally_finally_reichsmark_during_7_16_during_9_32(Start,End) :- finally_reichsmark_during_7_16(Start1,End1), Start is (Start1-9), End is (End1-32), Start=<End.

globally_finally_reichsmark_during_7_16_during_9_32_at_1830(Res) :- setof((Start,End),globally_finally_reichsmark_during_7_16_during_9_32(Start,End),AllINtervals), checkvalidity(1830,AllINtervals,Res).

check_query() :- write('Query = globally_finally_reichsmark_during_7_16_during_9_32_at_1830'), (globally_finally_reichsmark_during_7_16_during_9_32_at_1830(true) -> write('\nRes   = true');write('\nRes   = false')).

