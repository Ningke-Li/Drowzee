:- include('database.pl').
magnificent_century(Start,End) :- begin('magnificent_century',_,_,Start), end('magnificent_century',_,_,End), Start=<End.

globally_magnificent_century_during_1_2(Start,End) :- magnificent_century(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_magnificent_century_during_1_2_at_2010(Res) :- setof((Start,End),globally_magnificent_century_during_1_2(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = globally_magnificent_century_during_1_2_at_2010'), (globally_magnificent_century_during_1_2_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).

