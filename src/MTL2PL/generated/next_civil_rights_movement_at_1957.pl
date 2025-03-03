:- include('database.pl').
civil_rights_movement(Start,End) :- begin('civil_rights_movement',_,_,Start), end('civil_rights_movement',_,_,End), Start=<End.

next_civil_rights_movement(Start,End) :- civil_rights_movement(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_civil_rights_movement_at_1957(Res) :- setof((Start,End),next_civil_rights_movement(Start,End),AllINtervals), checkvalidity(1957,AllINtervals,Res).

check_query() :- write('Query = next_civil_rights_movement_at_1957'), (next_civil_rights_movement_at_1957(true) -> write('\nRes   = true');write('\nRes   = false')).

