:- include('database.pl').
liv_and_maddie(Start,End) :- begin('liv_and_maddie',_,_,Start), end('liv_and_maddie',_,_,End), Start=<End.

globally_liv_and_maddie_during_2_3(Start,End) :- liv_and_maddie(Start1,End1), Start is (Start1-2), End is (End1-3), Start=<End.

finally_globally_liv_and_maddie_during_2_3_during_6_20(Start,End) :- globally_liv_and_maddie_during_2_3(Start1,End1), (Start1-20)=<(End1-6), Start is (Start1-20), End is (End1-6), Start=<End.

finally_globally_liv_and_maddie_during_2_3_during_6_20_at_2043(Res) :- setof((Start,End),finally_globally_liv_and_maddie_during_2_3_during_6_20(Start,End),AllINtervals), checkvalidity(2043,AllINtervals,Res).

check_query() :- write('Query = finally_globally_liv_and_maddie_during_2_3_during_6_20_at_2043'), (finally_globally_liv_and_maddie_during_2_3_during_6_20_at_2043(true) -> write('\nRes   = true');write('\nRes   = false')).

