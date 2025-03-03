:- include('database.pl').
cypriot_pound(Start,End) :- begin('cypriot_pound',_,_,Start), end('cypriot_pound',_,_,End), Start=<End.

h_o__just_add_water(Start,End) :- begin('h_o__just_add_water',_,_,Start), end('h_o__just_add_water',_,_,End), Start=<End.

cypriot_pound_last_till_78_86(Start,End) :- cypriot_pound(Start1,End1), (End1-Start1)>=78, Start is (Start1+78), End is (End1+1).

cypriot_pound_until_h_o__just_add_water_during_78_86_overlap(Start,End) :- cypriot_pound_last_till_78_86(Start1,End1), h_o__just_add_water(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

cypriot_pound_until_h_o__just_add_water_during_78_86(Start,End) :- cypriot_pound(W1,_), cypriot_pound_until_h_o__just_add_water_during_78_86_overlap(Start1,End1), Start is max((Start1-86),W1), End is (End1-78), Start=<End.

cypriot_pound_until_h_o__just_add_water_during_78_86_at_1926(Res) :- setof((Start,End),cypriot_pound_until_h_o__just_add_water_during_78_86(Start,End),AllINtervals), checkvalidity(1926,AllINtervals,Res).

check_query() :- write('Query = cypriot_pound_until_h_o__just_add_water_during_78_86_at_1926'), (cypriot_pound_until_h_o__just_add_water_during_78_86_at_1926(true) -> write('\nRes   = true');write('\nRes   = false')).

