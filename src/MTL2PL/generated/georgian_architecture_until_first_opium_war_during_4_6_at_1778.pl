:- include('database.pl').
georgian_architecture(Start,End) :- begin('georgian_architecture',_,_,Start), end('georgian_architecture',_,_,End), Start=<End.

first_opium_war(Start,End) :- begin('first_opium_war',_,_,Start), end('first_opium_war',_,_,End), Start=<End.

georgian_architecture_last_till_4_6(Start,End) :- georgian_architecture(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

georgian_architecture_until_first_opium_war_during_4_6_overlap(Start,End) :- georgian_architecture_last_till_4_6(Start1,End1), first_opium_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

georgian_architecture_until_first_opium_war_during_4_6(Start,End) :- georgian_architecture(W1,_), georgian_architecture_until_first_opium_war_during_4_6_overlap(Start1,End1), Start is max((Start1-6),W1), End is (End1-4), Start=<End.

georgian_architecture_until_first_opium_war_during_4_6_at_1778(Res) :- setof((Start,End),georgian_architecture_until_first_opium_war_during_4_6(Start,End),AllINtervals), checkvalidity(1778,AllINtervals,Res).

check_query() :- write('Query = georgian_architecture_until_first_opium_war_during_4_6_at_1778'), (georgian_architecture_until_first_opium_war_during_4_6_at_1778(true) -> write('\nRes   = true');write('\nRes   = false')).

