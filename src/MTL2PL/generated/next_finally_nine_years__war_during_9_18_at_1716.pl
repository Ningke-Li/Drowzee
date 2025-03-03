:- include('database.pl').
nine_years__war(Start,End) :- begin('nine_years__war',_,_,Start), end('nine_years__war',_,_,End), Start=<End.

finally_nine_years__war_during_9_18(Start,End) :- nine_years__war(Start1,End1), (Start1-18)=<(End1-9), Start is (Start1-18), End is (End1-9), Start=<End.

next_finally_nine_years__war_during_9_18(Start,End) :- finally_nine_years__war_during_9_18(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_nine_years__war_during_9_18_at_1716(Res) :- setof((Start,End),next_finally_nine_years__war_during_9_18(Start,End),AllINtervals), checkvalidity(1716,AllINtervals,Res).

check_query() :- write('Query = next_finally_nine_years__war_during_9_18_at_1716'), (next_finally_nine_years__war_during_9_18_at_1716(true) -> write('\nRes   = true');write('\nRes   = false')).

