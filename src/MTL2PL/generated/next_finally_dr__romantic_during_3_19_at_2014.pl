:- include('database.pl').
dr__romantic(Start,End) :- begin('dr__romantic',_,_,Start), end('dr__romantic',_,_,End), Start=<End.

finally_dr__romantic_during_3_19(Start,End) :- dr__romantic(Start1,End1), (Start1-19)=<(End1-3), Start is (Start1-19), End is (End1-3), Start=<End.

next_finally_dr__romantic_during_3_19(Start,End) :- finally_dr__romantic_during_3_19(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_dr__romantic_during_3_19_at_2014(Res) :- setof((Start,End),next_finally_dr__romantic_during_3_19(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = next_finally_dr__romantic_during_3_19_at_2014'), (next_finally_dr__romantic_during_3_19_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).

