:- include('database.pl').
community(Start,End) :- begin('community',_,_,Start), end('community',_,_,End), Start=<End.

finally_community_during_10_20(Start,End) :- community(Start1,End1), (Start1-20)=<(End1-10), Start is (Start1-20), End is (End1-10), Start=<End.

next_finally_community_during_10_20(Start,End) :- finally_community_during_10_20(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_community_during_10_20_at_1998(Res) :- setof((Start,End),next_finally_community_during_10_20(Start,End),AllINtervals), checkvalidity(1998,AllINtervals,Res).

check_query() :- write('Query = next_finally_community_during_10_20_at_1998'), (next_finally_community_during_10_20_at_1998(true) -> write('\nRes   = true');write('\nRes   = false')).

