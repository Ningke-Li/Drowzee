:- include('database.pl').
keeping_up_with_the_kardashians(Start,End) :- begin('keeping_up_with_the_kardashians',_,_,Start), end('keeping_up_with_the_kardashians',_,_,End), Start=<End.

finally_keeping_up_with_the_kardashians_during_5_15(Start,End) :- keeping_up_with_the_kardashians(Start1,End1), (Start1-15)=<(End1-5), Start is (Start1-15), End is (End1-5), Start=<End.

next_finally_keeping_up_with_the_kardashians_during_5_15(Start,End) :- finally_keeping_up_with_the_kardashians_during_5_15(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_keeping_up_with_the_kardashians_during_5_15_at_1949(Res) :- setof((Start,End),next_finally_keeping_up_with_the_kardashians_during_5_15(Start,End),AllINtervals), checkvalidity(1949,AllINtervals,Res).

check_query() :- write('Query = next_finally_keeping_up_with_the_kardashians_during_5_15_at_1949'), (next_finally_keeping_up_with_the_kardashians_during_5_15_at_1949(true) -> write('\nRes   = true');write('\nRes   = false')).

