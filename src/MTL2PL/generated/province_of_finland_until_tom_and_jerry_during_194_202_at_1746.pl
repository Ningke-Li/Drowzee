:- include('database.pl').
province_of_finland(Start,End) :- begin('province_of_finland',_,_,Start), end('province_of_finland',_,_,End), Start=<End.

tom_and_jerry(Start,End) :- begin('tom_and_jerry',_,_,Start), end('tom_and_jerry',_,_,End), Start=<End.

province_of_finland_last_till_194_202(Start,End) :- province_of_finland(Start1,End1), (End1-Start1)>=194, Start is (Start1+194), End is (End1+1).

province_of_finland_until_tom_and_jerry_during_194_202_overlap(Start,End) :- province_of_finland_last_till_194_202(Start1,End1), tom_and_jerry(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

province_of_finland_until_tom_and_jerry_during_194_202(Start,End) :- province_of_finland(W1,_), province_of_finland_until_tom_and_jerry_during_194_202_overlap(Start1,End1), Start is max((Start1-202),W1), End is (End1-194), Start=<End.

province_of_finland_until_tom_and_jerry_during_194_202_at_1746(Res) :- setof((Start,End),province_of_finland_until_tom_and_jerry_during_194_202(Start,End),AllINtervals), checkvalidity(1746,AllINtervals,Res).

check_query() :- write('Query = province_of_finland_until_tom_and_jerry_during_194_202_at_1746'), (province_of_finland_until_tom_and_jerry_during_194_202_at_1746(true) -> write('\nRes   = true');write('\nRes   = false')).

