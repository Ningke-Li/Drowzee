:- include('database.pl').
iraq_war(Start,End) :- begin('iraq_war',_,_,Start), end('iraq_war',_,_,End), Start=<End.

globally_iraq_war_during_1_7(Start,End) :- iraq_war(Start1,End1), Start is (Start1-1), End is (End1-7), Start=<End.

finally_globally_iraq_war_during_1_7_during_2_14(Start,End) :- globally_iraq_war_during_1_7(Start1,End1), (Start1-14)=<(End1-2), Start is (Start1-14), End is (End1-2), Start=<End.

finally_globally_iraq_war_during_1_7_during_2_14_at_1993(Res) :- setof((Start,End),finally_globally_iraq_war_during_1_7_during_2_14(Start,End),AllINtervals), checkvalidity(1993,AllINtervals,Res).

check_query() :- write('Query = finally_globally_iraq_war_during_1_7_during_2_14_at_1993'), (finally_globally_iraq_war_during_1_7_during_2_14_at_1993(true) -> write('\nRes   = true');write('\nRes   = false')).

