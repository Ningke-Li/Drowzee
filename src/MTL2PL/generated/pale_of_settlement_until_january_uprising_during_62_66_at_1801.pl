:- include('database.pl').
pale_of_settlement(Start,End) :- begin('pale_of_settlement',_,_,Start), end('pale_of_settlement',_,_,End), Start=<End.

january_uprising(Start,End) :- begin('january_uprising',_,_,Start), end('january_uprising',_,_,End), Start=<End.

pale_of_settlement_last_till_62_66(Start,End) :- pale_of_settlement(Start1,End1), (End1-Start1)>=62, Start is (Start1+62), End is (End1+1).

pale_of_settlement_until_january_uprising_during_62_66_overlap(Start,End) :- pale_of_settlement_last_till_62_66(Start1,End1), january_uprising(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

pale_of_settlement_until_january_uprising_during_62_66(Start,End) :- pale_of_settlement(W1,_), pale_of_settlement_until_january_uprising_during_62_66_overlap(Start1,End1), Start is max((Start1-66),W1), End is (End1-62), Start=<End.

pale_of_settlement_until_january_uprising_during_62_66_at_1801(Res) :- setof((Start,End),pale_of_settlement_until_january_uprising_during_62_66(Start,End),AllINtervals), checkvalidity(1801,AllINtervals,Res).

check_query() :- write('Query = pale_of_settlement_until_january_uprising_during_62_66_at_1801'), (pale_of_settlement_until_january_uprising_during_62_66_at_1801(true) -> write('\nRes   = true');write('\nRes   = false')).

