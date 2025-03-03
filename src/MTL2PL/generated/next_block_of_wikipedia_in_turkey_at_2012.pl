:- include('database.pl').
block_of_wikipedia_in_turkey(Start,End) :- begin('block_of_wikipedia_in_turkey',_,_,Start), end('block_of_wikipedia_in_turkey',_,_,End), Start=<End.

next_block_of_wikipedia_in_turkey(Start,End) :- block_of_wikipedia_in_turkey(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_block_of_wikipedia_in_turkey_at_2012(Res) :- setof((Start,End),next_block_of_wikipedia_in_turkey(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = next_block_of_wikipedia_in_turkey_at_2012'), (next_block_of_wikipedia_in_turkey_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).

