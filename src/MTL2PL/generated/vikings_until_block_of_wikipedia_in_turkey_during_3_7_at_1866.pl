:- include('database.pl').
vikings(Start,End) :- begin('vikings',_,_,Start), end('vikings',_,_,End), Start=<End.

block_of_wikipedia_in_turkey(Start,End) :- begin('block_of_wikipedia_in_turkey',_,_,Start), end('block_of_wikipedia_in_turkey',_,_,End), Start=<End.

vikings_last_till_3_7(Start,End) :- vikings(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

vikings_until_block_of_wikipedia_in_turkey_during_3_7_overlap(Start,End) :- vikings_last_till_3_7(Start1,End1), block_of_wikipedia_in_turkey(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

vikings_until_block_of_wikipedia_in_turkey_during_3_7(Start,End) :- vikings(W1,_), vikings_until_block_of_wikipedia_in_turkey_during_3_7_overlap(Start1,End1), Start is max((Start1-7),W1), End is (End1-3), Start=<End.

vikings_until_block_of_wikipedia_in_turkey_during_3_7_at_1866(Res) :- setof((Start,End),vikings_until_block_of_wikipedia_in_turkey_during_3_7(Start,End),AllINtervals), checkvalidity(1866,AllINtervals,Res).

check_query() :- write('Query = vikings_until_block_of_wikipedia_in_turkey_during_3_7_at_1866'), (vikings_until_block_of_wikipedia_in_turkey_during_3_7_at_1866(true) -> write('\nRes   = true');write('\nRes   = false')).

