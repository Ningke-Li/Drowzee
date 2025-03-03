:- include('database.pl').
cypriot_pound(Start,End) :- begin('cypriot_pound',_,_,Start), end('cypriot_pound',_,_,End), Start=<End.

next_cypriot_pound(Start,End) :- cypriot_pound(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_cypriot_pound_at_1931(Res) :- setof((Start,End),next_cypriot_pound(Start,End),AllINtervals), checkvalidity(1931,AllINtervals,Res).

check_query() :- write('Query = next_cypriot_pound_at_1931'), (next_cypriot_pound_at_1931(true) -> write('\nRes   = true');write('\nRes   = false')).

