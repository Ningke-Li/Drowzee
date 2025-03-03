:- include('database.pl').
community(Start,End) :- begin('community',_,_,Start), end('community',_,_,End), Start=<End.

finally_community_during_5_20(Start,End) :- community(Start1,End1), (Start1-20)=<(End1-5), Start is (Start1-20), End is (End1-5), Start=<End.

finally_community_during_5_20_at_1986(Res) :- setof((Start,End),finally_community_during_5_20(Start,End),AllINtervals), checkvalidity(1986,AllINtervals,Res).

check_query() :- write('Query = finally_community_during_5_20_at_1986'), (finally_community_during_5_20_at_1986(true) -> write('\nRes   = true');write('\nRes   = false')).

