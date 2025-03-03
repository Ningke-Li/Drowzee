:- include('database.pl').
private_practice(Start,End) :- begin('private_practice',_,_,Start), end('private_practice',_,_,End), Start=<End.

globally_private_practice_during_2_5(Start,End) :- private_practice(Start1,End1), Start is (Start1-2), End is (End1-5), Start=<End.

finally_globally_private_practice_during_2_5_during_1_11(Start,End) :- globally_private_practice_during_2_5(Start1,End1), (Start1-11)=<(End1-1), Start is (Start1-11), End is (End1-1), Start=<End.

finally_globally_private_practice_during_2_5_during_1_11_at_2001(Res) :- setof((Start,End),finally_globally_private_practice_during_2_5_during_1_11(Start,End),AllINtervals), checkvalidity(2001,AllINtervals,Res).

check_query() :- write('Query = finally_globally_private_practice_during_2_5_during_1_11_at_2001'), (finally_globally_private_practice_during_2_5_during_1_11_at_2001(true) -> write('\nRes   = true');write('\nRes   = false')).

