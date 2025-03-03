:- include('database.pl').
the_good_wife(Start,End) :- begin('the_good_wife',_,_,Start), end('the_good_wife',_,_,End), Start=<End.

jane_the_virgin(Start,End) :- begin('jane_the_virgin',_,_,Start), end('jane_the_virgin',_,_,End), Start=<End.

the_good_wife_last_till_3_13(Start,End) :- the_good_wife(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

the_good_wife_until_jane_the_virgin_during_3_13_overlap(Start,End) :- the_good_wife_last_till_3_13(Start1,End1), jane_the_virgin(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_good_wife_until_jane_the_virgin_during_3_13(Start,End) :- the_good_wife(W1,_), the_good_wife_until_jane_the_virgin_during_3_13_overlap(Start1,End1), Start is max((Start1-13),W1), End is (End1-3), Start=<End.

the_good_wife_until_jane_the_virgin_during_3_13_at_2010(Res) :- setof((Start,End),the_good_wife_until_jane_the_virgin_during_3_13(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = the_good_wife_until_jane_the_virgin_during_3_13_at_2010'), (the_good_wife_until_jane_the_virgin_during_3_13_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).

