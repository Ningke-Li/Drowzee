:- include('database.pl').
tom_and_jerry(Start,End) :- begin('tom_and_jerry',_,_,Start), end('tom_and_jerry',_,_,End), Start=<End.

berlin_blockade(Start,End) :- begin('berlin_blockade',_,_,Start), end('berlin_blockade',_,_,End), Start=<End.

tom_and_jerry_last_till_7_9(Start,End) :- tom_and_jerry(Start1,End1), (End1-Start1)>=7, Start is (Start1+7), End is (End1+1).

tom_and_jerry_until_berlin_blockade_during_7_9_overlap(Start,End) :- tom_and_jerry_last_till_7_9(Start1,End1), berlin_blockade(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

tom_and_jerry_until_berlin_blockade_during_7_9(Start,End) :- tom_and_jerry(W1,_), tom_and_jerry_until_berlin_blockade_during_7_9_overlap(Start1,End1), Start is max((Start1-9),W1), End is (End1-7), Start=<End.

tom_and_jerry_until_berlin_blockade_during_7_9_at_1984(Res) :- setof((Start,End),tom_and_jerry_until_berlin_blockade_during_7_9(Start,End),AllINtervals), checkvalidity(1984,AllINtervals,Res).

check_query() :- write('Query = tom_and_jerry_until_berlin_blockade_during_7_9_at_1984'), (tom_and_jerry_until_berlin_blockade_during_7_9_at_1984(true) -> write('\nRes   = true');write('\nRes   = false')).

