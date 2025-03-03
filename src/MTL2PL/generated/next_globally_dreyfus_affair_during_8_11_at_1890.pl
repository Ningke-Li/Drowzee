:- include('database.pl').
dreyfus_affair(Start,End) :- begin('dreyfus_affair',_,_,Start), end('dreyfus_affair',_,_,End), Start=<End.

globally_dreyfus_affair_during_8_11(Start,End) :- dreyfus_affair(Start1,End1), Start is (Start1-8), End is (End1-11), Start=<End.

next_globally_dreyfus_affair_during_8_11(Start,End) :- globally_dreyfus_affair_during_8_11(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_dreyfus_affair_during_8_11_at_1890(Res) :- setof((Start,End),next_globally_dreyfus_affair_during_8_11(Start,End),AllINtervals), checkvalidity(1890,AllINtervals,Res).

check_query() :- write('Query = next_globally_dreyfus_affair_during_8_11_at_1890'), (next_globally_dreyfus_affair_during_8_11_at_1890(true) -> write('\nRes   = true');write('\nRes   = false')).

