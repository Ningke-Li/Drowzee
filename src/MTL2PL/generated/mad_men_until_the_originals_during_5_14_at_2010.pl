:- include('database.pl').
mad_men(Start,End) :- begin('mad_men',_,_,Start), end('mad_men',_,_,End), Start=<End.

the_originals(Start,End) :- begin('the_originals',_,_,Start), end('the_originals',_,_,End), Start=<End.

mad_men_last_till_5_14(Start,End) :- mad_men(Start1,End1), (End1-Start1)>=5, Start is (Start1+5), End is (End1+1).

mad_men_until_the_originals_during_5_14_overlap(Start,End) :- mad_men_last_till_5_14(Start1,End1), the_originals(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

mad_men_until_the_originals_during_5_14(Start,End) :- mad_men(W1,_), mad_men_until_the_originals_during_5_14_overlap(Start1,End1), Start is max((Start1-14),W1), End is (End1-5), Start=<End.

mad_men_until_the_originals_during_5_14_at_2010(Res) :- setof((Start,End),mad_men_until_the_originals_during_5_14(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = mad_men_until_the_originals_during_5_14_at_2010'), (mad_men_until_the_originals_during_5_14_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).

