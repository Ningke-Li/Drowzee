:- include('database.pl').
keeping_up_with_the_kardashians(Start,End) :- begin('keeping_up_with_the_kardashians',_,_,Start), end('keeping_up_with_the_kardashians',_,_,End), Start=<End.

globally_keeping_up_with_the_kardashians_during_3_5(Start,End) :- keeping_up_with_the_kardashians(Start1,End1), Start is (Start1-3), End is (End1-5), Start=<End.

next_globally_keeping_up_with_the_kardashians_during_3_5(Start,End) :- globally_keeping_up_with_the_kardashians_during_3_5(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_keeping_up_with_the_kardashians_during_3_5_at_2038(Res) :- setof((Start,End),next_globally_keeping_up_with_the_kardashians_during_3_5(Start,End),AllINtervals), checkvalidity(2038,AllINtervals,Res).

check_query() :- write('Query = next_globally_keeping_up_with_the_kardashians_during_3_5_at_2038'), (next_globally_keeping_up_with_the_kardashians_during_3_5_at_2038(true) -> write('\nRes   = true');write('\nRes   = false')).

