:- include('database.pl').
malcolm_in_the_middle(Start,End) :- begin('malcolm_in_the_middle',_,_,Start), end('malcolm_in_the_middle',_,_,End), Start=<End.

finally_malcolm_in_the_middle_during_8_11(Start,End) :- malcolm_in_the_middle(Start1,End1), (Start1-11)=<(End1-8), Start is (Start1-11), End is (End1-8), Start=<End.

finally_malcolm_in_the_middle_during_8_11_at_1872(Res) :- setof((Start,End),finally_malcolm_in_the_middle_during_8_11(Start,End),AllINtervals), checkvalidity(1872,AllINtervals,Res).

check_query() :- write('Query = finally_malcolm_in_the_middle_during_8_11_at_1872'), (finally_malcolm_in_the_middle_during_8_11_at_1872(true) -> write('\nRes   = true');write('\nRes   = false')).

