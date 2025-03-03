:- include('database.pl').
the_shield(Start,End) :- begin('the_shield',_,_,Start), end('the_shield',_,_,End), Start=<End.

jericho(Start,End) :- begin('jericho',_,_,Start), end('jericho',_,_,End), Start=<End.

the_shield_last_till_3_4(Start,End) :- the_shield(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

the_shield_until_jericho_during_3_4_overlap(Start,End) :- the_shield_last_till_3_4(Start1,End1), jericho(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_shield_until_jericho_during_3_4(Start,End) :- the_shield(W1,_), the_shield_until_jericho_during_3_4_overlap(Start1,End1), Start is max((Start1-4),W1), End is (End1-3), Start=<End.

the_shield_until_jericho_during_3_4_at_2003(Res) :- setof((Start,End),the_shield_until_jericho_during_3_4(Start,End),AllINtervals), checkvalidity(2003,AllINtervals,Res).

check_query() :- write('Query = the_shield_until_jericho_during_3_4_at_2003'), (the_shield_until_jericho_during_3_4_at_2003(true) -> write('\nRes   = true');write('\nRes   = false')).

