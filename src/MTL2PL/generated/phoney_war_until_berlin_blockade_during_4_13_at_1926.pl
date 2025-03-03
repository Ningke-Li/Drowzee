:- include('database.pl').
phoney_war(Start,End) :- begin('phoney_war',_,_,Start), end('phoney_war',_,_,End), Start=<End.

berlin_blockade(Start,End) :- begin('berlin_blockade',_,_,Start), end('berlin_blockade',_,_,End), Start=<End.

phoney_war_last_till_4_13(Start,End) :- phoney_war(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

phoney_war_until_berlin_blockade_during_4_13_overlap(Start,End) :- phoney_war_last_till_4_13(Start1,End1), berlin_blockade(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

phoney_war_until_berlin_blockade_during_4_13(Start,End) :- phoney_war(W1,_), phoney_war_until_berlin_blockade_during_4_13_overlap(Start1,End1), Start is max((Start1-13),W1), End is (End1-4), Start=<End.

phoney_war_until_berlin_blockade_during_4_13_at_1926(Res) :- setof((Start,End),phoney_war_until_berlin_blockade_during_4_13(Start,End),AllINtervals), checkvalidity(1926,AllINtervals,Res).

check_query() :- write('Query = phoney_war_until_berlin_blockade_during_4_13_at_1926'), (phoney_war_until_berlin_blockade_during_4_13_at_1926(true) -> write('\nRes   = true');write('\nRes   = false')).

