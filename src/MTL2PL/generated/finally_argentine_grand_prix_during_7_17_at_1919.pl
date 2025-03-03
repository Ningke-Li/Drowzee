:- include('database.pl').
argentine_grand_prix(Start,End) :- begin('argentine_grand_prix',_,_,Start), end('argentine_grand_prix',_,_,End), Start=<End.

finally_argentine_grand_prix_during_7_17(Start,End) :- argentine_grand_prix(Start1,End1), (Start1-17)=<(End1-7), Start is (Start1-17), End is (End1-7), Start=<End.

finally_argentine_grand_prix_during_7_17_at_1919(Res) :- setof((Start,End),finally_argentine_grand_prix_during_7_17(Start,End),AllINtervals), checkvalidity(1919,AllINtervals,Res).

check_query() :- write('Query = finally_argentine_grand_prix_during_7_17_at_1919'), (finally_argentine_grand_prix_during_7_17_at_1919(true) -> write('\nRes   = true');write('\nRes   = false')).

