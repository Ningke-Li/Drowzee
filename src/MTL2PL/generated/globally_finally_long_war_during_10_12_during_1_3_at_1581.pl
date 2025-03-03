:- include('database.pl').
long_war(Start,End) :- begin('long_war',_,_,Start), end('long_war',_,_,End), Start=<End.

finally_long_war_during_10_12(Start,End) :- long_war(Start1,End1), (Start1-12)=<(End1-10), Start is (Start1-12), End is (End1-10), Start=<End.

globally_finally_long_war_during_10_12_during_1_3(Start,End) :- finally_long_war_during_10_12(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

globally_finally_long_war_during_10_12_during_1_3_at_1581(Res) :- setof((Start,End),globally_finally_long_war_during_10_12_during_1_3(Start,End),AllINtervals), checkvalidity(1581,AllINtervals,Res).

check_query() :- write('Query = globally_finally_long_war_during_10_12_during_1_3_at_1581'), (globally_finally_long_war_during_10_12_during_1_3_at_1581(true) -> write('\nRes   = true');write('\nRes   = false')).

