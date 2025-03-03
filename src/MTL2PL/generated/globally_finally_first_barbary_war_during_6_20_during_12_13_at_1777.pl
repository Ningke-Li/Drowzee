:- include('database.pl').
first_barbary_war(Start,End) :- begin('first_barbary_war',_,_,Start), end('first_barbary_war',_,_,End), Start=<End.

finally_first_barbary_war_during_6_20(Start,End) :- first_barbary_war(Start1,End1), (Start1-20)=<(End1-6), Start is (Start1-20), End is (End1-6), Start=<End.

globally_finally_first_barbary_war_during_6_20_during_12_13(Start,End) :- finally_first_barbary_war_during_6_20(Start1,End1), Start is (Start1-12), End is (End1-13), Start=<End.

globally_finally_first_barbary_war_during_6_20_during_12_13_at_1777(Res) :- setof((Start,End),globally_finally_first_barbary_war_during_6_20_during_12_13(Start,End),AllINtervals), checkvalidity(1777,AllINtervals,Res).

check_query() :- write('Query = globally_finally_first_barbary_war_during_6_20_during_12_13_at_1777'), (globally_finally_first_barbary_war_during_6_20_during_12_13_at_1777(true) -> write('\nRes   = true');write('\nRes   = false')).

