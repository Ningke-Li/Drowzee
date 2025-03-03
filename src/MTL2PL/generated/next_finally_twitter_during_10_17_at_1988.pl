:- include('database.pl').
twitter(Start,End) :- begin('twitter',_,_,Start), end('twitter',_,_,End), Start=<End.

finally_twitter_during_10_17(Start,End) :- twitter(Start1,End1), (Start1-17)=<(End1-10), Start is (Start1-17), End is (End1-10), Start=<End.

next_finally_twitter_during_10_17(Start,End) :- finally_twitter_during_10_17(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_twitter_during_10_17_at_1988(Res) :- setof((Start,End),next_finally_twitter_during_10_17(Start,End),AllINtervals), checkvalidity(1988,AllINtervals,Res).

check_query() :- write('Query = next_finally_twitter_during_10_17_at_1988'), (next_finally_twitter_during_10_17_at_1988(true) -> write('\nRes   = true');write('\nRes   = false')).

