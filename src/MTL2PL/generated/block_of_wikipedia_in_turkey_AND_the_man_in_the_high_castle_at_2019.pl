:- include('database.pl').
block_of_wikipedia_in_turkey(Start,End) :- begin('block_of_wikipedia_in_turkey',_,_,Start), end('block_of_wikipedia_in_turkey',_,_,End), Start=<End.

the_man_in_the_high_castle(Start,End) :- begin('the_man_in_the_high_castle',_,_,Start), end('the_man_in_the_high_castle',_,_,End), Start=<End.

generate_facts_block_of_wikipedia_in_turkey_AND_the_man_in_the_high_castle([]) :- assert(block_of_wikipedia_in_turkey_AND_the_man_in_the_high_castle(-1,-1)).

generate_facts_block_of_wikipedia_in_turkey_AND_the_man_in_the_high_castle([(Start,End) | Tail]) :- assert(block_of_wikipedia_in_turkey_AND_the_man_in_the_high_castle(Start,End)), generate_facts_block_of_wikipedia_in_turkey_AND_the_man_in_the_high_castle(Tail).

block_of_wikipedia_in_turkey_AND_the_man_in_the_high_castle_aux() :- findall((Start,End),block_of_wikipedia_in_turkey(Start,End),Interval1), findall((Start,End),the_man_in_the_high_castle(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_block_of_wikipedia_in_turkey_AND_the_man_in_the_high_castle(Interval).

block_of_wikipedia_in_turkey_AND_the_man_in_the_high_castle_at_2019(Res) :- setof((Start,End),block_of_wikipedia_in_turkey_AND_the_man_in_the_high_castle(Start,End),AllINtervals), checkvalidity(2019,AllINtervals,Res).

check_query() :- write('Query = block_of_wikipedia_in_turkey_AND_the_man_in_the_high_castle_at_2019'), (block_of_wikipedia_in_turkey_AND_the_man_in_the_high_castle_at_2019(true) -> write('\nRes   = true');write('\nRes   = false')).
?- block_of_wikipedia_in_turkey_AND_the_man_in_the_high_castle_aux().

