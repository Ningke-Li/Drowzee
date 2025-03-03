:- include('database.pl').
ev_24(Start,End) :- begin('ev_24',_,_,Start), end('ev_24',_,_,End), Start=<End.

the_good_wife(Start,End) :- begin('the_good_wife',_,_,Start), end('the_good_wife',_,_,End), Start=<End.

ev_24_last_till_1_5(Start,End) :- ev_24(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

ev_24_until_the_good_wife_during_1_5_overlap(Start,End) :- ev_24_last_till_1_5(Start1,End1), the_good_wife(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

ev_24_until_the_good_wife_during_1_5(Start,End) :- ev_24(W1,_), ev_24_until_the_good_wife_during_1_5_overlap(Start1,End1), Start is max((Start1-5),W1), End is (End1-1), Start=<End.

ev_24_until_the_good_wife_during_1_5_at_1918(Res) :- setof((Start,End),ev_24_until_the_good_wife_during_1_5(Start,End),AllINtervals), checkvalidity(1918,AllINtervals,Res).

check_query() :- write('Query = ev_24_until_the_good_wife_during_1_5_at_1918'), (ev_24_until_the_good_wife_during_1_5_at_1918(true) -> write('\nRes   = true');write('\nRes   = false')).

