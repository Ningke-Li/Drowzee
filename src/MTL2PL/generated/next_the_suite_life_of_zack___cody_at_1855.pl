:- include('database.pl').
the_suite_life_of_zack___cody(Start,End) :- begin('the_suite_life_of_zack___cody',_,_,Start), end('the_suite_life_of_zack___cody',_,_,End), Start=<End.

next_the_suite_life_of_zack___cody(Start,End) :- the_suite_life_of_zack___cody(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_the_suite_life_of_zack___cody_at_1855(Res) :- setof((Start,End),next_the_suite_life_of_zack___cody(Start,End),AllINtervals), checkvalidity(1855,AllINtervals,Res).

check_query() :- write('Query = next_the_suite_life_of_zack___cody_at_1855'), (next_the_suite_life_of_zack___cody_at_1855(true) -> write('\nRes   = true');write('\nRes   = false')).

