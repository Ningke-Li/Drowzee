:- include('database.pl').
the_suite_life_on_deck(Start,End) :- begin('the_suite_life_on_deck',_,_,Start), end('the_suite_life_on_deck',_,_,End), Start=<End.

finally_the_suite_life_on_deck_during_8_15(Start,End) :- the_suite_life_on_deck(Start1,End1), (Start1-15)=<(End1-8), Start is (Start1-15), End is (End1-8), Start=<End.

finally_the_suite_life_on_deck_during_8_15_at_1864(Res) :- setof((Start,End),finally_the_suite_life_on_deck_during_8_15(Start,End),AllINtervals), checkvalidity(1864,AllINtervals,Res).

check_query() :- write('Query = finally_the_suite_life_on_deck_during_8_15_at_1864'), (finally_the_suite_life_on_deck_during_8_15_at_1864(true) -> write('\nRes   = true');write('\nRes   = false')).

