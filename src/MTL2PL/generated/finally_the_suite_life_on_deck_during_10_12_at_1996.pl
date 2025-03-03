:- include('database.pl').
the_suite_life_on_deck(Start,End) :- begin('the_suite_life_on_deck',_,_,Start), end('the_suite_life_on_deck',_,_,End), Start=<End.

finally_the_suite_life_on_deck_during_10_12(Start,End) :- the_suite_life_on_deck(Start1,End1), (Start1-12)=<(End1-10), Start is (Start1-12), End is (End1-10), Start=<End.

finally_the_suite_life_on_deck_during_10_12_at_1996(Res) :- setof((Start,End),finally_the_suite_life_on_deck_during_10_12(Start,End),AllINtervals), checkvalidity(1996,AllINtervals,Res).

check_query() :- write('Query = finally_the_suite_life_on_deck_during_10_12_at_1996'), (finally_the_suite_life_on_deck_during_10_12_at_1996(true) -> write('\nRes   = true');write('\nRes   = false')).

