:- include('database.pl').
operation_weser_bung(Start,End) :- begin('operation_weser_bung',_,_,Start), end('operation_weser_bung',_,_,End), Start=<End.

next_operation_weser_bung(Start,End) :- operation_weser_bung(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_operation_weser_bung_at_1939(Res) :- setof((Start,End),next_operation_weser_bung(Start,End),AllINtervals), checkvalidity(1939,AllINtervals,Res).

check_query() :- write('Query = next_operation_weser_bung_at_1939'), (next_operation_weser_bung_at_1939(true) -> write('\nRes   = true');write('\nRes   = false')).

