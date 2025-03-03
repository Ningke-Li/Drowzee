:- include('database.pl').
america_s_next_top_model(Start,End) :- begin('america_s_next_top_model',_,_,Start), end('america_s_next_top_model',_,_,End), Start=<End.

finally_america_s_next_top_model_during_10_19(Start,End) :- america_s_next_top_model(Start1,End1), (Start1-19)=<(End1-10), Start is (Start1-19), End is (End1-10), Start=<End.

finally_america_s_next_top_model_during_10_19_at_1996(Res) :- setof((Start,End),finally_america_s_next_top_model_during_10_19(Start,End),AllINtervals), checkvalidity(1996,AllINtervals,Res).

check_query() :- write('Query = finally_america_s_next_top_model_during_10_19_at_1996'), (finally_america_s_next_top_model_during_10_19_at_1996(true) -> write('\nRes   = true');write('\nRes   = false')).

