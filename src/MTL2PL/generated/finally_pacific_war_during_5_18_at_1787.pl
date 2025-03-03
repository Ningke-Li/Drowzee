:- include('database.pl').
pacific_war(Start,End) :- begin('pacific_war',_,_,Start), end('pacific_war',_,_,End), Start=<End.

finally_pacific_war_during_5_18(Start,End) :- pacific_war(Start1,End1), (Start1-18)=<(End1-5), Start is (Start1-18), End is (End1-5), Start=<End.

finally_pacific_war_during_5_18_at_1787(Res) :- setof((Start,End),finally_pacific_war_during_5_18(Start,End),AllINtervals), checkvalidity(1787,AllINtervals,Res).

check_query() :- write('Query = finally_pacific_war_during_5_18_at_1787'), (finally_pacific_war_during_5_18_at_1787(true) -> write('\nRes   = true');write('\nRes   = false')).

