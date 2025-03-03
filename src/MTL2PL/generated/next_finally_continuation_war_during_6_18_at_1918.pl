:- include('database.pl').
continuation_war(Start,End) :- begin('continuation_war',_,_,Start), end('continuation_war',_,_,End), Start=<End.

finally_continuation_war_during_6_18(Start,End) :- continuation_war(Start1,End1), (Start1-18)=<(End1-6), Start is (Start1-18), End is (End1-6), Start=<End.

next_finally_continuation_war_during_6_18(Start,End) :- finally_continuation_war_during_6_18(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_continuation_war_during_6_18_at_1918(Res) :- setof((Start,End),next_finally_continuation_war_during_6_18(Start,End),AllINtervals), checkvalidity(1918,AllINtervals,Res).

check_query() :- write('Query = next_finally_continuation_war_during_6_18_at_1918'), (next_finally_continuation_war_during_6_18_at_1918(true) -> write('\nRes   = true');write('\nRes   = false')).

