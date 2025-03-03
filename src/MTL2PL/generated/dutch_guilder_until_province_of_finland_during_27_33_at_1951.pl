:- include('database.pl').
dutch_guilder(Start,End) :- begin('dutch_guilder',_,_,Start), end('dutch_guilder',_,_,End), Start=<End.

province_of_finland(Start,End) :- begin('province_of_finland',_,_,Start), end('province_of_finland',_,_,End), Start=<End.

dutch_guilder_last_till_27_33(Start,End) :- dutch_guilder(Start1,End1), (End1-Start1)>=27, Start is (Start1+27), End is (End1+1).

dutch_guilder_until_province_of_finland_during_27_33_overlap(Start,End) :- dutch_guilder_last_till_27_33(Start1,End1), province_of_finland(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

dutch_guilder_until_province_of_finland_during_27_33(Start,End) :- dutch_guilder(W1,_), dutch_guilder_until_province_of_finland_during_27_33_overlap(Start1,End1), Start is max((Start1-33),W1), End is (End1-27), Start=<End.

dutch_guilder_until_province_of_finland_during_27_33_at_1951(Res) :- setof((Start,End),dutch_guilder_until_province_of_finland_during_27_33(Start,End),AllINtervals), checkvalidity(1951,AllINtervals,Res).

check_query() :- write('Query = dutch_guilder_until_province_of_finland_during_27_33_at_1951'), (dutch_guilder_until_province_of_finland_during_27_33_at_1951(true) -> write('\nRes   = true');write('\nRes   = false')).

