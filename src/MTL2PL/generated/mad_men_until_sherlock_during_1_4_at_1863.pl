:- include('database.pl').
mad_men(Start,End) :- begin('mad_men',_,_,Start), end('mad_men',_,_,End), Start=<End.

sherlock(Start,End) :- begin('sherlock',_,_,Start), end('sherlock',_,_,End), Start=<End.

mad_men_last_till_1_4(Start,End) :- mad_men(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

mad_men_until_sherlock_during_1_4_overlap(Start,End) :- mad_men_last_till_1_4(Start1,End1), sherlock(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

mad_men_until_sherlock_during_1_4(Start,End) :- mad_men(W1,_), mad_men_until_sherlock_during_1_4_overlap(Start1,End1), Start is max((Start1-4),W1), End is (End1-1), Start=<End.

mad_men_until_sherlock_during_1_4_at_1863(Res) :- setof((Start,End),mad_men_until_sherlock_during_1_4(Start,End),AllINtervals), checkvalidity(1863,AllINtervals,Res).

check_query() :- write('Query = mad_men_until_sherlock_during_1_4_at_1863'), (mad_men_until_sherlock_during_1_4_at_1863(true) -> write('\nRes   = true');write('\nRes   = false')).

