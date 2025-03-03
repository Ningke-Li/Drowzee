:- include('database.pl').
orient_express(Start,End) :- begin('orient_express',_,_,Start), end('orient_express',_,_,End), Start=<End.

utc_00_44(Start,End) :- begin('utc_00_44',_,_,Start), end('utc_00_44',_,_,End), Start=<End.

orient_express_last_till_18_23(Start,End) :- orient_express(Start1,End1), (End1-Start1)>=18, Start is (Start1+18), End is (End1+1).

orient_express_until_utc_00_44_during_18_23_overlap(Start,End) :- orient_express_last_till_18_23(Start1,End1), utc_00_44(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

orient_express_until_utc_00_44_during_18_23(Start,End) :- orient_express(W1,_), orient_express_until_utc_00_44_during_18_23_overlap(Start1,End1), Start is max((Start1-23),W1), End is (End1-18), Start=<End.

orient_express_until_utc_00_44_during_18_23_at_1898(Res) :- setof((Start,End),orient_express_until_utc_00_44_during_18_23(Start,End),AllINtervals), checkvalidity(1898,AllINtervals,Res).

check_query() :- write('Query = orient_express_until_utc_00_44_during_18_23_at_1898'), (orient_express_until_utc_00_44_during_18_23_at_1898(true) -> write('\nRes   = true');write('\nRes   = false')).

