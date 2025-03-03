:- include('database.pl').
italian_lira(Start,End) :- begin('italian_lira',_,_,Start), end('italian_lira',_,_,End), Start=<End.

orient_express(Start,End) :- begin('orient_express',_,_,Start), end('orient_express',_,_,End), Start=<End.

italian_lira_last_till_9_16(Start,End) :- italian_lira(Start1,End1), (End1-Start1)>=9, Start is (Start1+9), End is (End1+1).

italian_lira_until_orient_express_during_9_16_overlap(Start,End) :- italian_lira_last_till_9_16(Start1,End1), orient_express(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

italian_lira_until_orient_express_during_9_16(Start,End) :- italian_lira(W1,_), italian_lira_until_orient_express_during_9_16_overlap(Start1,End1), Start is max((Start1-16),W1), End is (End1-9), Start=<End.

italian_lira_until_orient_express_during_9_16_at_2032(Res) :- setof((Start,End),italian_lira_until_orient_express_during_9_16(Start,End),AllINtervals), checkvalidity(2032,AllINtervals,Res).

check_query() :- write('Query = italian_lira_until_orient_express_during_9_16_at_2032'), (italian_lira_until_orient_express_during_9_16_at_2032(true) -> write('\nRes   = true');write('\nRes   = false')).

