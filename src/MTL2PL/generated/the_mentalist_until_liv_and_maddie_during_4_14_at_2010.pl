:- include('database.pl').
the_mentalist(Start,End) :- begin('the_mentalist',_,_,Start), end('the_mentalist',_,_,End), Start=<End.

liv_and_maddie(Start,End) :- begin('liv_and_maddie',_,_,Start), end('liv_and_maddie',_,_,End), Start=<End.

the_mentalist_last_till_4_14(Start,End) :- the_mentalist(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

the_mentalist_until_liv_and_maddie_during_4_14_overlap(Start,End) :- the_mentalist_last_till_4_14(Start1,End1), liv_and_maddie(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_mentalist_until_liv_and_maddie_during_4_14(Start,End) :- the_mentalist(W1,_), the_mentalist_until_liv_and_maddie_during_4_14_overlap(Start1,End1), Start is max((Start1-14),W1), End is (End1-4), Start=<End.

the_mentalist_until_liv_and_maddie_during_4_14_at_2010(Res) :- setof((Start,End),the_mentalist_until_liv_and_maddie_during_4_14(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = the_mentalist_until_liv_and_maddie_during_4_14_at_2010'), (the_mentalist_until_liv_and_maddie_during_4_14_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).

