:- include('database.pl').
teen_titans(Start,End) :- begin('teen_titans',_,_,Start), end('teen_titans',_,_,End), Start=<End.

finally_teen_titans_during_1_20(Start,End) :- teen_titans(Start1,End1), (Start1-20)=<(End1-1), Start is (Start1-20), End is (End1-1), Start=<End.

finally_teen_titans_during_1_20_at_2002(Res) :- setof((Start,End),finally_teen_titans_during_1_20(Start,End),AllINtervals), checkvalidity(2002,AllINtervals,Res).

check_query() :- write('Query = finally_teen_titans_during_1_20_at_2002'), (finally_teen_titans_during_1_20_at_2002(true) -> write('\nRes   = true');write('\nRes   = false')).

