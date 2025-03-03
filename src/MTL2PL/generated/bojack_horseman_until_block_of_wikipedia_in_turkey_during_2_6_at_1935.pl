:- include('database.pl').
bojack_horseman(Start,End) :- begin('bojack_horseman',_,_,Start), end('bojack_horseman',_,_,End), Start=<End.

block_of_wikipedia_in_turkey(Start,End) :- begin('block_of_wikipedia_in_turkey',_,_,Start), end('block_of_wikipedia_in_turkey',_,_,End), Start=<End.

bojack_horseman_last_till_2_6(Start,End) :- bojack_horseman(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

bojack_horseman_until_block_of_wikipedia_in_turkey_during_2_6_overlap(Start,End) :- bojack_horseman_last_till_2_6(Start1,End1), block_of_wikipedia_in_turkey(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

bojack_horseman_until_block_of_wikipedia_in_turkey_during_2_6(Start,End) :- bojack_horseman(W1,_), bojack_horseman_until_block_of_wikipedia_in_turkey_during_2_6_overlap(Start1,End1), Start is max((Start1-6),W1), End is (End1-2), Start=<End.

bojack_horseman_until_block_of_wikipedia_in_turkey_during_2_6_at_1935(Res) :- setof((Start,End),bojack_horseman_until_block_of_wikipedia_in_turkey_during_2_6(Start,End),AllINtervals), checkvalidity(1935,AllINtervals,Res).

check_query() :- write('Query = bojack_horseman_until_block_of_wikipedia_in_turkey_during_2_6_at_1935'), (bojack_horseman_until_block_of_wikipedia_in_turkey_during_2_6_at_1935(true) -> write('\nRes   = true');write('\nRes   = false')).

