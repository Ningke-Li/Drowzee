:- include('database.pl').
block_of_wikipedia_in_turkey(Start,End) :- begin('block_of_wikipedia_in_turkey',_,_,Start), end('block_of_wikipedia_in_turkey',_,_,End), Start=<End.

war_of_the_first_coalition(Start,End) :- begin('war_of_the_first_coalition',_,_,Start), end('war_of_the_first_coalition',_,_,End), Start=<End.

generate_facts_block_of_wikipedia_in_turkey_OR_war_of_the_first_coalition([]) :- assert(block_of_wikipedia_in_turkey_OR_war_of_the_first_coalition(-1,-1)).

generate_facts_block_of_wikipedia_in_turkey_OR_war_of_the_first_coalition([(Start,End) | Tail]) :- assert(block_of_wikipedia_in_turkey_OR_war_of_the_first_coalition(Start,End)), generate_facts_block_of_wikipedia_in_turkey_OR_war_of_the_first_coalition(Tail).

block_of_wikipedia_in_turkey_OR_war_of_the_first_coalition_aux() :- findall((Start,End),block_of_wikipedia_in_turkey(Start,End),Interval1), findall((Start,End),war_of_the_first_coalition(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_block_of_wikipedia_in_turkey_OR_war_of_the_first_coalition(Interval).

block_of_wikipedia_in_turkey_OR_war_of_the_first_coalition_at_2006(Res) :- setof((Start,End),block_of_wikipedia_in_turkey_OR_war_of_the_first_coalition(Start,End),AllINtervals), checkvalidity(2006,AllINtervals,Res).

check_query() :- write('Query = block_of_wikipedia_in_turkey_OR_war_of_the_first_coalition_at_2006'), (block_of_wikipedia_in_turkey_OR_war_of_the_first_coalition_at_2006(true) -> write('\nRes   = true');write('\nRes   = false')).
?- block_of_wikipedia_in_turkey_OR_war_of_the_first_coalition_aux().

