:- include('database.pl').
unification_of_italy(Start,End) :- begin('unification_of_italy',_,_,Start), end('unification_of_italy',_,_,End), Start=<End.

finally_unification_of_italy_during_8_17(Start,End) :- unification_of_italy(Start1,End1), (Start1-17)=<(End1-8), Start is (Start1-17), End is (End1-8), Start=<End.

globally_finally_unification_of_italy_during_8_17_during_16_25(Start,End) :- finally_unification_of_italy_during_8_17(Start1,End1), Start is (Start1-16), End is (End1-25), Start=<End.

globally_finally_unification_of_italy_during_8_17_during_16_25_at_1817(Res) :- setof((Start,End),globally_finally_unification_of_italy_during_8_17_during_16_25(Start,End),AllINtervals), checkvalidity(1817,AllINtervals,Res).

check_query() :- write('Query = globally_finally_unification_of_italy_during_8_17_during_16_25_at_1817'), (globally_finally_unification_of_italy_during_8_17_during_16_25_at_1817(true) -> write('\nRes   = true');write('\nRes   = false')).

