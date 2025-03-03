:- include('database.pl').
the_vampire_diaries(Start,End) :- begin('the_vampire_diaries',_,_,Start), end('the_vampire_diaries',_,_,End), Start=<End.

scandal(Start,End) :- begin('scandal',_,_,Start), end('scandal',_,_,End), Start=<End.

the_vampire_diaries_last_till_2_7(Start,End) :- the_vampire_diaries(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

the_vampire_diaries_until_scandal_during_2_7_overlap(Start,End) :- the_vampire_diaries_last_till_2_7(Start1,End1), scandal(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_vampire_diaries_until_scandal_during_2_7(Start,End) :- the_vampire_diaries(W1,_), the_vampire_diaries_until_scandal_during_2_7_overlap(Start1,End1), Start is max((Start1-7),W1), End is (End1-2), Start=<End.

the_vampire_diaries_until_scandal_during_2_7_at_2008(Res) :- setof((Start,End),the_vampire_diaries_until_scandal_during_2_7(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = the_vampire_diaries_until_scandal_during_2_7_at_2008'), (the_vampire_diaries_until_scandal_during_2_7_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).

