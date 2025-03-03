:- include('database.pl').
province_of_finland(Start,End) :- begin('province_of_finland',_,_,Start), end('province_of_finland',_,_,End), Start=<End.

opium_wars(Start,End) :- begin('opium_wars',_,_,Start), end('opium_wars',_,_,End), Start=<End.

province_of_finland_last_till_63_65(Start,End) :- province_of_finland(Start1,End1), (End1-Start1)>=63, Start is (Start1+63), End is (End1+1).

province_of_finland_until_opium_wars_during_63_65_overlap(Start,End) :- province_of_finland_last_till_63_65(Start1,End1), opium_wars(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

province_of_finland_until_opium_wars_during_63_65(Start,End) :- province_of_finland(W1,_), province_of_finland_until_opium_wars_during_63_65_overlap(Start1,End1), Start is max((Start1-65),W1), End is (End1-63), Start=<End.

province_of_finland_until_opium_wars_during_63_65_at_1640(Res) :- setof((Start,End),province_of_finland_until_opium_wars_during_63_65(Start,End),AllINtervals), checkvalidity(1640,AllINtervals,Res).

check_query() :- write('Query = province_of_finland_until_opium_wars_during_63_65_at_1640'), (province_of_finland_until_opium_wars_during_63_65_at_1640(true) -> write('\nRes   = true');write('\nRes   = false')).

