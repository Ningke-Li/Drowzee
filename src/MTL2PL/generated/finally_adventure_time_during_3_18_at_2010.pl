:- include('database.pl').
adventure_time(Start,End) :- begin('adventure_time',_,_,Start), end('adventure_time',_,_,End), Start=<End.

finally_adventure_time_during_3_18(Start,End) :- adventure_time(Start1,End1), (Start1-18)=<(End1-3), Start is (Start1-18), End is (End1-3), Start=<End.

finally_adventure_time_during_3_18_at_2010(Res) :- setof((Start,End),finally_adventure_time_during_3_18(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = finally_adventure_time_during_3_18_at_2010'), (finally_adventure_time_during_3_18_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).

