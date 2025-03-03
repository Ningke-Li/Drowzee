:- include('database.pl').
the_fairly_oddparents(Start,End) :- begin('the_fairly_oddparents',_,_,Start), end('the_fairly_oddparents',_,_,End), Start=<End.

finally_the_fairly_oddparents_during_3_15(Start,End) :- the_fairly_oddparents(Start1,End1), (Start1-15)=<(End1-3), Start is (Start1-15), End is (End1-3), Start=<End.

globally_finally_the_fairly_oddparents_during_3_15_during_2_28(Start,End) :- finally_the_fairly_oddparents_during_3_15(Start1,End1), Start is (Start1-2), End is (End1-28), Start=<End.

globally_finally_the_fairly_oddparents_during_3_15_during_2_28_at_1985(Res) :- setof((Start,End),globally_finally_the_fairly_oddparents_during_3_15_during_2_28(Start,End),AllINtervals), checkvalidity(1985,AllINtervals,Res).

check_query() :- write('Query = globally_finally_the_fairly_oddparents_during_3_15_during_2_28_at_1985'), (globally_finally_the_fairly_oddparents_during_3_15_during_2_28_at_1985(true) -> write('\nRes   = true');write('\nRes   = false')).

