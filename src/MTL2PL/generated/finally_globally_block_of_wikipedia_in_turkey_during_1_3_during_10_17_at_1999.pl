:- include('database.pl').
block_of_wikipedia_in_turkey(Start,End) :- begin('block_of_wikipedia_in_turkey',_,_,Start), end('block_of_wikipedia_in_turkey',_,_,End), Start=<End.

globally_block_of_wikipedia_in_turkey_during_1_3(Start,End) :- block_of_wikipedia_in_turkey(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

finally_globally_block_of_wikipedia_in_turkey_during_1_3_during_10_17(Start,End) :- globally_block_of_wikipedia_in_turkey_during_1_3(Start1,End1), (Start1-17)=<(End1-10), Start is (Start1-17), End is (End1-10), Start=<End.

finally_globally_block_of_wikipedia_in_turkey_during_1_3_during_10_17_at_1999(Res) :- setof((Start,End),finally_globally_block_of_wikipedia_in_turkey_during_1_3_during_10_17(Start,End),AllINtervals), checkvalidity(1999,AllINtervals,Res).

check_query() :- write('Query = finally_globally_block_of_wikipedia_in_turkey_during_1_3_during_10_17_at_1999'), (finally_globally_block_of_wikipedia_in_turkey_during_1_3_during_10_17_at_1999(true) -> write('\nRes   = true');write('\nRes   = false')).

