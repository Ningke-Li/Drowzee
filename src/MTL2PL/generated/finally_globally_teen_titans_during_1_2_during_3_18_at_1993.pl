:- include('database.pl').
teen_titans(Start,End) :- begin('teen_titans',_,_,Start), end('teen_titans',_,_,End), Start=<End.

globally_teen_titans_during_1_2(Start,End) :- teen_titans(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

finally_globally_teen_titans_during_1_2_during_3_18(Start,End) :- globally_teen_titans_during_1_2(Start1,End1), (Start1-18)=<(End1-3), Start is (Start1-18), End is (End1-3), Start=<End.

finally_globally_teen_titans_during_1_2_during_3_18_at_1993(Res) :- setof((Start,End),finally_globally_teen_titans_during_1_2_during_3_18(Start,End),AllINtervals), checkvalidity(1993,AllINtervals,Res).

check_query() :- write('Query = finally_globally_teen_titans_during_1_2_during_3_18_at_1993'), (finally_globally_teen_titans_during_1_2_during_3_18_at_1993(true) -> write('\nRes   = true');write('\nRes   = false')).

