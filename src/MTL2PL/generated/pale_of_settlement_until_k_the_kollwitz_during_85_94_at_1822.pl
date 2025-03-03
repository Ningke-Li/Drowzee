:- include('database.pl').
pale_of_settlement(Start,End) :- begin('pale_of_settlement',_,_,Start), end('pale_of_settlement',_,_,End), Start=<End.

k_the_kollwitz(Start,End) :- begin('k_the_kollwitz',_,_,Start), end('k_the_kollwitz',_,_,End), Start=<End.

pale_of_settlement_last_till_85_94(Start,End) :- pale_of_settlement(Start1,End1), (End1-Start1)>=85, Start is (Start1+85), End is (End1+1).

pale_of_settlement_until_k_the_kollwitz_during_85_94_overlap(Start,End) :- pale_of_settlement_last_till_85_94(Start1,End1), k_the_kollwitz(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

pale_of_settlement_until_k_the_kollwitz_during_85_94(Start,End) :- pale_of_settlement(W1,_), pale_of_settlement_until_k_the_kollwitz_during_85_94_overlap(Start1,End1), Start is max((Start1-94),W1), End is (End1-85), Start=<End.

pale_of_settlement_until_k_the_kollwitz_during_85_94_at_1822(Res) :- setof((Start,End),pale_of_settlement_until_k_the_kollwitz_during_85_94(Start,End),AllINtervals), checkvalidity(1822,AllINtervals,Res).

check_query() :- write('Query = pale_of_settlement_until_k_the_kollwitz_during_85_94_at_1822'), (pale_of_settlement_until_k_the_kollwitz_during_85_94_at_1822(true) -> write('\nRes   = true');write('\nRes   = false')).

