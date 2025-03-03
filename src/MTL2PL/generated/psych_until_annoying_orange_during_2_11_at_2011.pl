:- include('database.pl').
psych(Start,End) :- begin('psych',_,_,Start), end('psych',_,_,End), Start=<End.

annoying_orange(Start,End) :- begin('annoying_orange',_,_,Start), end('annoying_orange',_,_,End), Start=<End.

psych_last_till_2_11(Start,End) :- psych(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

psych_until_annoying_orange_during_2_11_overlap(Start,End) :- psych_last_till_2_11(Start1,End1), annoying_orange(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

psych_until_annoying_orange_during_2_11(Start,End) :- psych(W1,_), psych_until_annoying_orange_during_2_11_overlap(Start1,End1), Start is max((Start1-11),W1), End is (End1-2), Start=<End.

psych_until_annoying_orange_during_2_11_at_2011(Res) :- setof((Start,End),psych_until_annoying_orange_during_2_11(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = psych_until_annoying_orange_during_2_11_at_2011'), (psych_until_annoying_orange_during_2_11_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).

