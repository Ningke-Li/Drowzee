:- include('database.pl').
andromeda(Start,End) :- begin('andromeda',_,_,Start), end('andromeda',_,_,End), Start=<End.

cold_case(Start,End) :- begin('cold_case',_,_,Start), end('cold_case',_,_,End), Start=<End.

andromeda_last_till_2_5(Start,End) :- andromeda(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

andromeda_until_cold_case_during_2_5_overlap(Start,End) :- andromeda_last_till_2_5(Start1,End1), cold_case(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

andromeda_until_cold_case_during_2_5(Start,End) :- andromeda(W1,_), andromeda_until_cold_case_during_2_5_overlap(Start1,End1), Start is max((Start1-5),W1), End is (End1-2), Start=<End.

andromeda_until_cold_case_during_2_5_at_2044(Res) :- setof((Start,End),andromeda_until_cold_case_during_2_5(Start,End),AllINtervals), checkvalidity(2044,AllINtervals,Res).

check_query() :- write('Query = andromeda_until_cold_case_during_2_5_at_2044'), (andromeda_until_cold_case_during_2_5_at_2044(true) -> write('\nRes   = true');write('\nRes   = false')).

