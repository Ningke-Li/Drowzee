:- include('database.pl').
californication(Start,End) :- begin('californication',_,_,Start), end('californication',_,_,End), Start=<End.

globally_californication_during_3_5(Start,End) :- californication(Start1,End1), Start is (Start1-3), End is (End1-5), Start=<End.

next_globally_californication_during_3_5(Start,End) :- globally_californication_during_3_5(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_californication_during_3_5_at_1870(Res) :- setof((Start,End),next_globally_californication_during_3_5(Start,End),AllINtervals), checkvalidity(1870,AllINtervals,Res).

check_query() :- write('Query = next_globally_californication_during_3_5_at_1870'), (next_globally_californication_during_3_5_at_1870(true) -> write('\nRes   = true');write('\nRes   = false')).

