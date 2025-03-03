:- include('database.pl').
scrubs(Start,End) :- begin('scrubs',_,_,Start), end('scrubs',_,_,End), Start=<End.

the_good_wife(Start,End) :- begin('the_good_wife',_,_,Start), end('the_good_wife',_,_,End), Start=<End.

scrubs_last_till_2_11(Start,End) :- scrubs(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

scrubs_until_the_good_wife_during_2_11_overlap(Start,End) :- scrubs_last_till_2_11(Start1,End1), the_good_wife(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

scrubs_until_the_good_wife_during_2_11(Start,End) :- scrubs(W1,_), scrubs_until_the_good_wife_during_2_11_overlap(Start1,End1), Start is max((Start1-11),W1), End is (End1-2), Start=<End.

scrubs_until_the_good_wife_during_2_11_at_2008(Res) :- setof((Start,End),scrubs_until_the_good_wife_during_2_11(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = scrubs_until_the_good_wife_during_2_11_at_2008'), (scrubs_until_the_good_wife_during_2_11_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).

