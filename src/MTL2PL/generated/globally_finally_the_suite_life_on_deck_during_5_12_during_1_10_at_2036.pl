:- include('database.pl').
the_suite_life_on_deck(Start,End) :- begin('the_suite_life_on_deck',_,_,Start), end('the_suite_life_on_deck',_,_,End), Start=<End.

finally_the_suite_life_on_deck_during_5_12(Start,End) :- the_suite_life_on_deck(Start1,End1), (Start1-12)=<(End1-5), Start is (Start1-12), End is (End1-5), Start=<End.

globally_finally_the_suite_life_on_deck_during_5_12_during_1_10(Start,End) :- finally_the_suite_life_on_deck_during_5_12(Start1,End1), Start is (Start1-1), End is (End1-10), Start=<End.

globally_finally_the_suite_life_on_deck_during_5_12_during_1_10_at_2036(Res) :- setof((Start,End),globally_finally_the_suite_life_on_deck_during_5_12_during_1_10(Start,End),AllINtervals), checkvalidity(2036,AllINtervals,Res).

check_query() :- write('Query = globally_finally_the_suite_life_on_deck_during_5_12_during_1_10_at_2036'), (globally_finally_the_suite_life_on_deck_during_5_12_during_1_10_at_2036(true) -> write('\nRes   = true');write('\nRes   = false')).

