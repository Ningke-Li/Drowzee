:- include('database.pl').
second_industrial_revolution(Start,End) :- begin('second_industrial_revolution',_,_,Start), end('second_industrial_revolution',_,_,End), Start=<End.

first_boer_war(Start,End) :- begin('first_boer_war',_,_,Start), end('first_boer_war',_,_,End), Start=<End.

second_industrial_revolution_last_till_17_21(Start,End) :- second_industrial_revolution(Start1,End1), (End1-Start1)>=17, Start is (Start1+17), End is (End1+1).

second_industrial_revolution_until_first_boer_war_during_17_21_overlap(Start,End) :- second_industrial_revolution_last_till_17_21(Start1,End1), first_boer_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

second_industrial_revolution_until_first_boer_war_during_17_21(Start,End) :- second_industrial_revolution(W1,_), second_industrial_revolution_until_first_boer_war_during_17_21_overlap(Start1,End1), Start is max((Start1-21),W1), End is (End1-17), Start=<End.

second_industrial_revolution_until_first_boer_war_during_17_21_at_1786(Res) :- setof((Start,End),second_industrial_revolution_until_first_boer_war_during_17_21(Start,End),AllINtervals), checkvalidity(1786,AllINtervals,Res).

check_query() :- write('Query = second_industrial_revolution_until_first_boer_war_during_17_21_at_1786'), (second_industrial_revolution_until_first_boer_war_during_17_21_at_1786(true) -> write('\nRes   = true');write('\nRes   = false')).

