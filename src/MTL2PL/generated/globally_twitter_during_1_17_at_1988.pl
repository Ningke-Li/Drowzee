:- include('database.pl').
twitter(Start,End) :- begin('twitter',_,_,Start), end('twitter',_,_,End), Start=<End.

globally_twitter_during_1_17(Start,End) :- twitter(Start1,End1), Start is (Start1-1), End is (End1-17), Start=<End.

globally_twitter_during_1_17_at_1988(Res) :- setof((Start,End),globally_twitter_during_1_17(Start,End),AllINtervals), checkvalidity(1988,AllINtervals,Res).

check_query() :- write('Query = globally_twitter_during_1_17_at_1988'), (globally_twitter_during_1_17_at_1988(true) -> write('\nRes   = true');write('\nRes   = false')).

