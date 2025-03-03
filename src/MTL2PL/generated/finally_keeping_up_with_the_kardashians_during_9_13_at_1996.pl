:- include('database.pl').
keeping_up_with_the_kardashians(Start,End) :- begin('keeping_up_with_the_kardashians',_,_,Start), end('keeping_up_with_the_kardashians',_,_,End), Start=<End.

finally_keeping_up_with_the_kardashians_during_9_13(Start,End) :- keeping_up_with_the_kardashians(Start1,End1), (Start1-13)=<(End1-9), Start is (Start1-13), End is (End1-9), Start=<End.

finally_keeping_up_with_the_kardashians_during_9_13_at_1996(Res) :- setof((Start,End),finally_keeping_up_with_the_kardashians_during_9_13(Start,End),AllINtervals), checkvalidity(1996,AllINtervals,Res).

check_query() :- write('Query = finally_keeping_up_with_the_kardashians_during_9_13_at_1996'), (finally_keeping_up_with_the_kardashians_during_9_13_at_1996(true) -> write('\nRes   = true');write('\nRes   = false')).

