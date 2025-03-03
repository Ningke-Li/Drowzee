:- include('database.pl').
mad_men(Start,End) :- begin('mad_men',_,_,Start), end('mad_men',_,_,End), Start=<End.

veep(Start,End) :- begin('veep',_,_,Start), end('veep',_,_,End), Start=<End.

mad_men_last_till_2_11(Start,End) :- mad_men(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

mad_men_until_veep_during_2_11_overlap(Start,End) :- mad_men_last_till_2_11(Start1,End1), veep(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

mad_men_until_veep_during_2_11(Start,End) :- mad_men(W1,_), mad_men_until_veep_during_2_11_overlap(Start1,End1), Start is max((Start1-11),W1), End is (End1-2), Start=<End.

mad_men_until_veep_during_2_11_at_1889(Res) :- setof((Start,End),mad_men_until_veep_during_2_11(Start,End),AllINtervals), checkvalidity(1889,AllINtervals,Res).

check_query() :- write('Query = mad_men_until_veep_during_2_11_at_1889'), (mad_men_until_veep_during_2_11_at_1889(true) -> write('\nRes   = true');write('\nRes   = false')).

