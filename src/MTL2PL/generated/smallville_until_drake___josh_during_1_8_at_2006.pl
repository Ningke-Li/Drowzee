:- include('database.pl').
smallville(Start,End) :- begin('smallville',_,_,Start), end('smallville',_,_,End), Start=<End.

drake___josh(Start,End) :- begin('drake___josh',_,_,Start), end('drake___josh',_,_,End), Start=<End.

smallville_last_till_1_8(Start,End) :- smallville(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

smallville_until_drake___josh_during_1_8_overlap(Start,End) :- smallville_last_till_1_8(Start1,End1), drake___josh(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

smallville_until_drake___josh_during_1_8(Start,End) :- smallville(W1,_), smallville_until_drake___josh_during_1_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-1), Start=<End.

smallville_until_drake___josh_during_1_8_at_2006(Res) :- setof((Start,End),smallville_until_drake___josh_during_1_8(Start,End),AllINtervals), checkvalidity(2006,AllINtervals,Res).

check_query() :- write('Query = smallville_until_drake___josh_during_1_8_at_2006'), (smallville_until_drake___josh_during_1_8_at_2006(true) -> write('\nRes   = true');write('\nRes   = false')).

