:- include('database.pl').
the_suite_life_on_deck(Start,End) :- begin('the_suite_life_on_deck',_,_,Start), end('the_suite_life_on_deck',_,_,End), Start=<End.

globally_the_suite_life_on_deck_during_1_3(Start,End) :- the_suite_life_on_deck(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

globally_the_suite_life_on_deck_during_1_3_at_2008(Res) :- setof((Start,End),globally_the_suite_life_on_deck_during_1_3(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = globally_the_suite_life_on_deck_during_1_3_at_2008'), (globally_the_suite_life_on_deck_during_1_3_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).

