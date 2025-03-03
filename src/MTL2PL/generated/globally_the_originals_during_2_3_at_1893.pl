:- include('database.pl').
the_originals(Start,End) :- begin('the_originals',_,_,Start), end('the_originals',_,_,End), Start=<End.

globally_the_originals_during_2_3(Start,End) :- the_originals(Start1,End1), Start is (Start1-2), End is (End1-3), Start=<End.

globally_the_originals_during_2_3_at_1893(Res) :- setof((Start,End),globally_the_originals_during_2_3(Start,End),AllINtervals), checkvalidity(1893,AllINtervals,Res).

check_query() :- write('Query = globally_the_originals_during_2_3_at_1893'), (globally_the_originals_during_2_3_at_1893(true) -> write('\nRes   = true');write('\nRes   = false')).

