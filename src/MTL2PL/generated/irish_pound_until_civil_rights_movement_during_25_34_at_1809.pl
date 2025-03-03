:- include('database.pl').
irish_pound(Start,End) :- begin('irish_pound',_,_,Start), end('irish_pound',_,_,End), Start=<End.

civil_rights_movement(Start,End) :- begin('civil_rights_movement',_,_,Start), end('civil_rights_movement',_,_,End), Start=<End.

irish_pound_last_till_25_34(Start,End) :- irish_pound(Start1,End1), (End1-Start1)>=25, Start is (Start1+25), End is (End1+1).

irish_pound_until_civil_rights_movement_during_25_34_overlap(Start,End) :- irish_pound_last_till_25_34(Start1,End1), civil_rights_movement(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

irish_pound_until_civil_rights_movement_during_25_34(Start,End) :- irish_pound(W1,_), irish_pound_until_civil_rights_movement_during_25_34_overlap(Start1,End1), Start is max((Start1-34),W1), End is (End1-25), Start=<End.

irish_pound_until_civil_rights_movement_during_25_34_at_1809(Res) :- setof((Start,End),irish_pound_until_civil_rights_movement_during_25_34(Start,End),AllINtervals), checkvalidity(1809,AllINtervals,Res).

check_query() :- write('Query = irish_pound_until_civil_rights_movement_during_25_34_at_1809'), (irish_pound_until_civil_rights_movement_during_25_34_at_1809(true) -> write('\nRes   = true');write('\nRes   = false')).

