:- include('database.pl').
under_the_dome(Start,End) :- begin('under_the_dome',_,_,Start), end('under_the_dome',_,_,End), Start=<End.

globally_under_the_dome_during_1_2(Start,End) :- under_the_dome(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_under_the_dome_during_1_2_at_2012(Res) :- setof((Start,End),globally_under_the_dome_during_1_2(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = globally_under_the_dome_during_1_2_at_2012'), (globally_under_the_dome_during_1_2_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).

