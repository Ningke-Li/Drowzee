:- include('database.pl').
legends_of_tomorrow(Start,End) :- begin('legends_of_tomorrow',_,_,Start), end('legends_of_tomorrow',_,_,End), Start=<End.

finally_legends_of_tomorrow_during_8_13(Start,End) :- legends_of_tomorrow(Start1,End1), (Start1-13)=<(End1-8), Start is (Start1-13), End is (End1-8), Start=<End.

globally_finally_legends_of_tomorrow_during_8_13_during_2_7(Start,End) :- finally_legends_of_tomorrow_during_8_13(Start1,End1), Start is (Start1-2), End is (End1-7), Start=<End.

globally_finally_legends_of_tomorrow_during_8_13_during_2_7_at_1885(Res) :- setof((Start,End),globally_finally_legends_of_tomorrow_during_8_13_during_2_7(Start,End),AllINtervals), checkvalidity(1885,AllINtervals,Res).

check_query() :- write('Query = globally_finally_legends_of_tomorrow_during_8_13_during_2_7_at_1885'), (globally_finally_legends_of_tomorrow_during_8_13_during_2_7_at_1885(true) -> write('\nRes   = true');write('\nRes   = false')).

