:- include('database.pl').
the_vampire_diaries(Start,End) :- begin('the_vampire_diaries',_,_,Start), end('the_vampire_diaries',_,_,End), Start=<End.

hannibal(Start,End) :- begin('hannibal',_,_,Start), end('hannibal',_,_,End), Start=<End.

the_vampire_diaries_last_till_3_8(Start,End) :- the_vampire_diaries(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

the_vampire_diaries_until_hannibal_during_3_8_overlap(Start,End) :- the_vampire_diaries_last_till_3_8(Start1,End1), hannibal(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_vampire_diaries_until_hannibal_during_3_8(Start,End) :- the_vampire_diaries(W1,_), the_vampire_diaries_until_hannibal_during_3_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-3), Start=<End.

the_vampire_diaries_until_hannibal_during_3_8_at_2009(Res) :- setof((Start,End),the_vampire_diaries_until_hannibal_during_3_8(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = the_vampire_diaries_until_hannibal_during_3_8_at_2009'), (the_vampire_diaries_until_hannibal_during_3_8_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).

