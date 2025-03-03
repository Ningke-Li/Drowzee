:- include('database.pl').
the_good_wife(Start,End) :- begin('the_good_wife',_,_,Start), end('the_good_wife',_,_,End), Start=<End.

reign(Start,End) :- begin('reign',_,_,Start), end('reign',_,_,End), Start=<End.

the_good_wife_last_till_3_9(Start,End) :- the_good_wife(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

the_good_wife_until_reign_during_3_9_overlap(Start,End) :- the_good_wife_last_till_3_9(Start1,End1), reign(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_good_wife_until_reign_during_3_9(Start,End) :- the_good_wife(W1,_), the_good_wife_until_reign_during_3_9_overlap(Start1,End1), Start is max((Start1-9),W1), End is (End1-3), Start=<End.

the_good_wife_until_reign_during_3_9_at_2013(Res) :- setof((Start,End),the_good_wife_until_reign_during_3_9(Start,End),AllINtervals), checkvalidity(2013,AllINtervals,Res).

check_query() :- write('Query = the_good_wife_until_reign_during_3_9_at_2013'), (the_good_wife_until_reign_during_3_9_at_2013(true) -> write('\nRes   = true');write('\nRes   = false')).

