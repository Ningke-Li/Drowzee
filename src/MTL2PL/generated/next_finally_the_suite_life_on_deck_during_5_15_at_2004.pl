:- include('database.pl').
the_suite_life_on_deck(Start,End) :- begin('the_suite_life_on_deck',_,_,Start), end('the_suite_life_on_deck',_,_,End), Start=<End.

finally_the_suite_life_on_deck_during_5_15(Start,End) :- the_suite_life_on_deck(Start1,End1), (Start1-15)=<(End1-5), Start is (Start1-15), End is (End1-5), Start=<End.

next_finally_the_suite_life_on_deck_during_5_15(Start,End) :- finally_the_suite_life_on_deck_during_5_15(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_the_suite_life_on_deck_during_5_15_at_2004(Res) :- setof((Start,End),next_finally_the_suite_life_on_deck_during_5_15(Start,End),AllINtervals), checkvalidity(2004,AllINtervals,Res).

check_query() :- write('Query = next_finally_the_suite_life_on_deck_during_5_15_at_2004'), (next_finally_the_suite_life_on_deck_during_5_15_at_2004(true) -> write('\nRes   = true');write('\nRes   = false')).

