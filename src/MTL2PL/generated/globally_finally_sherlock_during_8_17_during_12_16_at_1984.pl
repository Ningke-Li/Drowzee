:- include('database.pl').
sherlock(Start,End) :- begin('sherlock',_,_,Start), end('sherlock',_,_,End), Start=<End.

finally_sherlock_during_8_17(Start,End) :- sherlock(Start1,End1), (Start1-17)=<(End1-8), Start is (Start1-17), End is (End1-8), Start=<End.

globally_finally_sherlock_during_8_17_during_12_16(Start,End) :- finally_sherlock_during_8_17(Start1,End1), Start is (Start1-12), End is (End1-16), Start=<End.

globally_finally_sherlock_during_8_17_during_12_16_at_1984(Res) :- setof((Start,End),globally_finally_sherlock_during_8_17_during_12_16(Start,End),AllINtervals), checkvalidity(1984,AllINtervals,Res).

check_query() :- write('Query = globally_finally_sherlock_during_8_17_during_12_16_at_1984'), (globally_finally_sherlock_during_8_17_during_12_16_at_1984(true) -> write('\nRes   = true');write('\nRes   = false')).

