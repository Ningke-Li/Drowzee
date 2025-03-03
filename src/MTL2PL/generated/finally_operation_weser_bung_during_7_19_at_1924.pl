:- include('database.pl').
operation_weser_bung(Start,End) :- begin('operation_weser_bung',_,_,Start), end('operation_weser_bung',_,_,End), Start=<End.

finally_operation_weser_bung_during_7_19(Start,End) :- operation_weser_bung(Start1,End1), (Start1-19)=<(End1-7), Start is (Start1-19), End is (End1-7), Start=<End.

finally_operation_weser_bung_during_7_19_at_1924(Res) :- setof((Start,End),finally_operation_weser_bung_during_7_19(Start,End),AllINtervals), checkvalidity(1924,AllINtervals,Res).

check_query() :- write('Query = finally_operation_weser_bung_during_7_19_at_1924'), (finally_operation_weser_bung_during_7_19_at_1924(true) -> write('\nRes   = true');write('\nRes   = false')).

