:- include('database.pl').
meiji_restoration(Start,End) :- begin('meiji_restoration',_,_,Start), end('meiji_restoration',_,_,End), Start=<End.

globally_meiji_restoration_during_2_21(Start,End) :- meiji_restoration(Start1,End1), Start is (Start1-2), End is (End1-21), Start=<End.

next_globally_meiji_restoration_during_2_21(Start,End) :- globally_meiji_restoration_during_2_21(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_meiji_restoration_during_2_21_at_1893(Res) :- setof((Start,End),next_globally_meiji_restoration_during_2_21(Start,End),AllINtervals), checkvalidity(1893,AllINtervals,Res).

check_query() :- write('Query = next_globally_meiji_restoration_during_2_21_at_1893'), (next_globally_meiji_restoration_during_2_21_at_1893(true) -> write('\nRes   = true');write('\nRes   = false')).

