:- include('database.pl').
battle_of_the_atlantic(Start,End) :- begin('battle_of_the_atlantic',_,_,Start), end('battle_of_the_atlantic',_,_,End), Start=<End.

globally_battle_of_the_atlantic_during_1_6(Start,End) :- battle_of_the_atlantic(Start1,End1), Start is (Start1-1), End is (End1-6), Start=<End.

next_globally_battle_of_the_atlantic_during_1_6(Start,End) :- globally_battle_of_the_atlantic_during_1_6(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_battle_of_the_atlantic_during_1_6_at_1819(Res) :- setof((Start,End),next_globally_battle_of_the_atlantic_during_1_6(Start,End),AllINtervals), checkvalidity(1819,AllINtervals,Res).

check_query() :- write('Query = next_globally_battle_of_the_atlantic_during_1_6_at_1819'), (next_globally_battle_of_the_atlantic_during_1_6_at_1819(true) -> write('\nRes   = true');write('\nRes   = false')).

