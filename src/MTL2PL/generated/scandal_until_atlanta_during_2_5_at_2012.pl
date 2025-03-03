:- include('database.pl').
scandal(Start,End) :- begin('scandal',_,_,Start), end('scandal',_,_,End), Start=<End.

atlanta(Start,End) :- begin('atlanta',_,_,Start), end('atlanta',_,_,End), Start=<End.

scandal_last_till_2_5(Start,End) :- scandal(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

scandal_until_atlanta_during_2_5_overlap(Start,End) :- scandal_last_till_2_5(Start1,End1), atlanta(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

scandal_until_atlanta_during_2_5(Start,End) :- scandal(W1,_), scandal_until_atlanta_during_2_5_overlap(Start1,End1), Start is max((Start1-5),W1), End is (End1-2), Start=<End.

scandal_until_atlanta_during_2_5_at_2012(Res) :- setof((Start,End),scandal_until_atlanta_during_2_5(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = scandal_until_atlanta_during_2_5_at_2012'), (scandal_until_atlanta_during_2_5_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).

