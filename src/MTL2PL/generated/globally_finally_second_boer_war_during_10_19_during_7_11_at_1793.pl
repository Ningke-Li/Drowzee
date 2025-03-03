:- include('database.pl').
second_boer_war(Start,End) :- begin('second_boer_war',_,_,Start), end('second_boer_war',_,_,End), Start=<End.

finally_second_boer_war_during_10_19(Start,End) :- second_boer_war(Start1,End1), (Start1-19)=<(End1-10), Start is (Start1-19), End is (End1-10), Start=<End.

globally_finally_second_boer_war_during_10_19_during_7_11(Start,End) :- finally_second_boer_war_during_10_19(Start1,End1), Start is (Start1-7), End is (End1-11), Start=<End.

globally_finally_second_boer_war_during_10_19_during_7_11_at_1793(Res) :- setof((Start,End),globally_finally_second_boer_war_during_10_19_during_7_11(Start,End),AllINtervals), checkvalidity(1793,AllINtervals,Res).

check_query() :- write('Query = globally_finally_second_boer_war_during_10_19_during_7_11_at_1793'), (globally_finally_second_boer_war_during_10_19_during_7_11_at_1793(true) -> write('\nRes   = true');write('\nRes   = false')).

