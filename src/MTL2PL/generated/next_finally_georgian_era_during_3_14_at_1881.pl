:- include('database.pl').
georgian_era(Start,End) :- begin('georgian_era',_,_,Start), end('georgian_era',_,_,End), Start=<End.

finally_georgian_era_during_3_14(Start,End) :- georgian_era(Start1,End1), (Start1-14)=<(End1-3), Start is (Start1-14), End is (End1-3), Start=<End.

next_finally_georgian_era_during_3_14(Start,End) :- finally_georgian_era_during_3_14(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_georgian_era_during_3_14_at_1881(Res) :- setof((Start,End),next_finally_georgian_era_during_3_14(Start,End),AllINtervals), checkvalidity(1881,AllINtervals,Res).

check_query() :- write('Query = next_finally_georgian_era_during_3_14_at_1881'), (next_finally_georgian_era_during_3_14_at_1881(true) -> write('\nRes   = true');write('\nRes   = false')).

