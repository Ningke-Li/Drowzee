:- include('database.pl').
italian_front(Start,End) :- begin('italian_front',_,_,Start), end('italian_front',_,_,End), Start=<End.

globally_italian_front_during_1_3(Start,End) :- italian_front(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

finally_globally_italian_front_during_1_3_during_5_18(Start,End) :- globally_italian_front_during_1_3(Start1,End1), (Start1-18)=<(End1-5), Start is (Start1-18), End is (End1-5), Start=<End.

finally_globally_italian_front_during_1_3_during_5_18_at_1807(Res) :- setof((Start,End),finally_globally_italian_front_during_1_3_during_5_18(Start,End),AllINtervals), checkvalidity(1807,AllINtervals,Res).

check_query() :- write('Query = finally_globally_italian_front_during_1_3_during_5_18_at_1807'), (finally_globally_italian_front_during_1_3_during_5_18_at_1807(true) -> write('\nRes   = true');write('\nRes   = false')).

