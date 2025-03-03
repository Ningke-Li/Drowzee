:- include('database.pl').
war_in_afghanistan(Start,End) :- begin('war_in_afghanistan',_,_,Start), end('war_in_afghanistan',_,_,End), Start=<End.

second_libyan_civil_war(Start,End) :- begin('second_libyan_civil_war',_,_,Start), end('second_libyan_civil_war',_,_,End), Start=<End.

war_in_afghanistan_last_till_12_17(Start,End) :- war_in_afghanistan(Start1,End1), (End1-Start1)>=12, Start is (Start1+12), End is (End1+1).

war_in_afghanistan_until_second_libyan_civil_war_during_12_17_overlap(Start,End) :- war_in_afghanistan_last_till_12_17(Start1,End1), second_libyan_civil_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

war_in_afghanistan_until_second_libyan_civil_war_during_12_17(Start,End) :- war_in_afghanistan(W1,_), war_in_afghanistan_until_second_libyan_civil_war_during_12_17_overlap(Start1,End1), Start is max((Start1-17),W1), End is (End1-12), Start=<End.

war_in_afghanistan_until_second_libyan_civil_war_during_12_17_at_2003(Res) :- setof((Start,End),war_in_afghanistan_until_second_libyan_civil_war_during_12_17(Start,End),AllINtervals), checkvalidity(2003,AllINtervals,Res).

check_query() :- write('Query = war_in_afghanistan_until_second_libyan_civil_war_during_12_17_at_2003'), (war_in_afghanistan_until_second_libyan_civil_war_during_12_17_at_2003(true) -> write('\nRes   = true');write('\nRes   = false')).

