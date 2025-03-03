:- include('database.pl').
romanian_war_of_independence(Start,End) :- begin('romanian_war_of_independence',_,_,Start), end('romanian_war_of_independence',_,_,End), Start=<End.

finally_romanian_war_of_independence_during_7_14(Start,End) :- romanian_war_of_independence(Start1,End1), (Start1-14)=<(End1-7), Start is (Start1-14), End is (End1-7), Start=<End.

finally_romanian_war_of_independence_during_7_14_at_1776(Res) :- setof((Start,End),finally_romanian_war_of_independence_during_7_14(Start,End),AllINtervals), checkvalidity(1776,AllINtervals,Res).

check_query() :- write('Query = finally_romanian_war_of_independence_during_7_14_at_1776'), (finally_romanian_war_of_independence_during_7_14_at_1776(true) -> write('\nRes   = true');write('\nRes   = false')).

