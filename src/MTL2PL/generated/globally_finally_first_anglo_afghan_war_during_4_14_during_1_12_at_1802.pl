:- include('database.pl').
first_anglo_afghan_war(Start,End) :- begin('first_anglo_afghan_war',_,_,Start), end('first_anglo_afghan_war',_,_,End), Start=<End.

finally_first_anglo_afghan_war_during_4_14(Start,End) :- first_anglo_afghan_war(Start1,End1), (Start1-14)=<(End1-4), Start is (Start1-14), End is (End1-4), Start=<End.

globally_finally_first_anglo_afghan_war_during_4_14_during_1_12(Start,End) :- finally_first_anglo_afghan_war_during_4_14(Start1,End1), Start is (Start1-1), End is (End1-12), Start=<End.

globally_finally_first_anglo_afghan_war_during_4_14_during_1_12_at_1802(Res) :- setof((Start,End),globally_finally_first_anglo_afghan_war_during_4_14_during_1_12(Start,End),AllINtervals), checkvalidity(1802,AllINtervals,Res).

check_query() :- write('Query = globally_finally_first_anglo_afghan_war_during_4_14_during_1_12_at_1802'), (globally_finally_first_anglo_afghan_war_during_4_14_during_1_12_at_1802(true) -> write('\nRes   = true');write('\nRes   = false')).

