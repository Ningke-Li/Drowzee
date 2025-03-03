:- include('database.pl').
keeping_up_with_the_kardashians(Start,End) :- begin('keeping_up_with_the_kardashians',_,_,Start), end('keeping_up_with_the_kardashians',_,_,End), Start=<End.

next_keeping_up_with_the_kardashians(Start,End) :- keeping_up_with_the_kardashians(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_keeping_up_with_the_kardashians_at_2009(Res) :- setof((Start,End),next_keeping_up_with_the_kardashians(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = next_keeping_up_with_the_kardashians_at_2009'), (next_keeping_up_with_the_kardashians_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).

