:- include('database.pl').
banana_wars(Start,End) :- begin('banana_wars',_,_,Start), end('banana_wars',_,_,End), Start=<End.

finally_banana_wars_during_9_20(Start,End) :- banana_wars(Start1,End1), (Start1-20)=<(End1-9), Start is (Start1-20), End is (End1-9), Start=<End.

finally_banana_wars_during_9_20_at_1763(Res) :- setof((Start,End),finally_banana_wars_during_9_20(Start,End),AllINtervals), checkvalidity(1763,AllINtervals,Res).

check_query() :- write('Query = finally_banana_wars_during_9_20_at_1763'), (finally_banana_wars_during_9_20_at_1763(true) -> write('\nRes   = true');write('\nRes   = false')).

