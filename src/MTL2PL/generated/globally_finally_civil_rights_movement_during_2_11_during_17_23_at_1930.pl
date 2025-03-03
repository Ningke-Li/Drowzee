:- include('database.pl').
civil_rights_movement(Start,End) :- begin('civil_rights_movement',_,_,Start), end('civil_rights_movement',_,_,End), Start=<End.

finally_civil_rights_movement_during_2_11(Start,End) :- civil_rights_movement(Start1,End1), (Start1-11)=<(End1-2), Start is (Start1-11), End is (End1-2), Start=<End.

globally_finally_civil_rights_movement_during_2_11_during_17_23(Start,End) :- finally_civil_rights_movement_during_2_11(Start1,End1), Start is (Start1-17), End is (End1-23), Start=<End.

globally_finally_civil_rights_movement_during_2_11_during_17_23_at_1930(Res) :- setof((Start,End),globally_finally_civil_rights_movement_during_2_11_during_17_23(Start,End),AllINtervals), checkvalidity(1930,AllINtervals,Res).

check_query() :- write('Query = globally_finally_civil_rights_movement_during_2_11_during_17_23_at_1930'), (globally_finally_civil_rights_movement_during_2_11_during_17_23_at_1930(true) -> write('\nRes   = true');write('\nRes   = false')).

