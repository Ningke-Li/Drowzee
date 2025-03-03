:- include('database.pl').
philippine_american_war(Start,End) :- begin('philippine_american_war',_,_,Start), end('philippine_american_war',_,_,End), Start=<End.

finally_philippine_american_war_during_4_18(Start,End) :- philippine_american_war(Start1,End1), (Start1-18)=<(End1-4), Start is (Start1-18), End is (End1-4), Start=<End.

next_finally_philippine_american_war_during_4_18(Start,End) :- finally_philippine_american_war_during_4_18(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_philippine_american_war_during_4_18_at_1880(Res) :- setof((Start,End),next_finally_philippine_american_war_during_4_18(Start,End),AllINtervals), checkvalidity(1880,AllINtervals,Res).

check_query() :- write('Query = next_finally_philippine_american_war_during_4_18_at_1880'), (next_finally_philippine_american_war_during_4_18_at_1880(true) -> write('\nRes   = true');write('\nRes   = false')).

