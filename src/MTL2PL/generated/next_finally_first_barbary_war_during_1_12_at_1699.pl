:- include('database.pl').
first_barbary_war(Start,End) :- begin('first_barbary_war',_,_,Start), end('first_barbary_war',_,_,End), Start=<End.

finally_first_barbary_war_during_1_12(Start,End) :- first_barbary_war(Start1,End1), (Start1-12)=<(End1-1), Start is (Start1-12), End is (End1-1), Start=<End.

next_finally_first_barbary_war_during_1_12(Start,End) :- finally_first_barbary_war_during_1_12(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_first_barbary_war_during_1_12_at_1699(Res) :- setof((Start,End),next_finally_first_barbary_war_during_1_12(Start,End),AllINtervals), checkvalidity(1699,AllINtervals,Res).

check_query() :- write('Query = next_finally_first_barbary_war_during_1_12_at_1699'), (next_finally_first_barbary_war_during_1_12_at_1699(true) -> write('\nRes   = true');write('\nRes   = false')).

