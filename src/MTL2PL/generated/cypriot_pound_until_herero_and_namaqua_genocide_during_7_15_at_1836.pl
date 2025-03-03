:- include('database.pl').
cypriot_pound(Start,End) :- begin('cypriot_pound',_,_,Start), end('cypriot_pound',_,_,End), Start=<End.

herero_and_namaqua_genocide(Start,End) :- begin('herero_and_namaqua_genocide',_,_,Start), end('herero_and_namaqua_genocide',_,_,End), Start=<End.

cypriot_pound_last_till_7_15(Start,End) :- cypriot_pound(Start1,End1), (End1-Start1)>=7, Start is (Start1+7), End is (End1+1).

cypriot_pound_until_herero_and_namaqua_genocide_during_7_15_overlap(Start,End) :- cypriot_pound_last_till_7_15(Start1,End1), herero_and_namaqua_genocide(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

cypriot_pound_until_herero_and_namaqua_genocide_during_7_15(Start,End) :- cypriot_pound(W1,_), cypriot_pound_until_herero_and_namaqua_genocide_during_7_15_overlap(Start1,End1), Start is max((Start1-15),W1), End is (End1-7), Start=<End.

cypriot_pound_until_herero_and_namaqua_genocide_during_7_15_at_1836(Res) :- setof((Start,End),cypriot_pound_until_herero_and_namaqua_genocide_during_7_15(Start,End),AllINtervals), checkvalidity(1836,AllINtervals,Res).

check_query() :- write('Query = cypriot_pound_until_herero_and_namaqua_genocide_during_7_15_at_1836'), (cypriot_pound_until_herero_and_namaqua_genocide_during_7_15_at_1836(true) -> write('\nRes   = true');write('\nRes   = false')).

