:- include('database.pl').
coup_of_18_brumaire(Start,End) :- begin('coup_of_18_brumaire',_,_,Start), end('coup_of_18_brumaire',_,_,End), Start=<End.

finally_coup_of_18_brumaire_during_2_18(Start,End) :- coup_of_18_brumaire(Start1,End1), (Start1-18)=<(End1-2), Start is (Start1-18), End is (End1-2), Start=<End.

finally_coup_of_18_brumaire_during_2_18_at_1782(Res) :- setof((Start,End),finally_coup_of_18_brumaire_during_2_18(Start,End),AllINtervals), checkvalidity(1782,AllINtervals,Res).

check_query() :- write('Query = finally_coup_of_18_brumaire_during_2_18_at_1782'), (finally_coup_of_18_brumaire_during_2_18_at_1782(true) -> write('\nRes   = true');write('\nRes   = false')).

