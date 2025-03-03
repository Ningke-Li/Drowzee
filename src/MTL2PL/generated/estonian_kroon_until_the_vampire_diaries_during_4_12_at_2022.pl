:- include('database.pl').
estonian_kroon(Start,End) :- begin('estonian_kroon',_,_,Start), end('estonian_kroon',_,_,End), Start=<End.

the_vampire_diaries(Start,End) :- begin('the_vampire_diaries',_,_,Start), end('the_vampire_diaries',_,_,End), Start=<End.

estonian_kroon_last_till_4_12(Start,End) :- estonian_kroon(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

estonian_kroon_until_the_vampire_diaries_during_4_12_overlap(Start,End) :- estonian_kroon_last_till_4_12(Start1,End1), the_vampire_diaries(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

estonian_kroon_until_the_vampire_diaries_during_4_12(Start,End) :- estonian_kroon(W1,_), estonian_kroon_until_the_vampire_diaries_during_4_12_overlap(Start1,End1), Start is max((Start1-12),W1), End is (End1-4), Start=<End.

estonian_kroon_until_the_vampire_diaries_during_4_12_at_2022(Res) :- setof((Start,End),estonian_kroon_until_the_vampire_diaries_during_4_12(Start,End),AllINtervals), checkvalidity(2022,AllINtervals,Res).

check_query() :- write('Query = estonian_kroon_until_the_vampire_diaries_during_4_12_at_2022'), (estonian_kroon_until_the_vampire_diaries_during_4_12_at_2022(true) -> write('\nRes   = true');write('\nRes   = false')).

