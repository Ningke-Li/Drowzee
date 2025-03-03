:- include('database.pl').
jim_crow_laws(Start,End) :- begin('jim_crow_laws',_,_,Start), end('jim_crow_laws',_,_,End), Start=<End.

argentine_grand_prix(Start,End) :- begin('argentine_grand_prix',_,_,Start), end('argentine_grand_prix',_,_,End), Start=<End.

jim_crow_laws_last_till_14_22(Start,End) :- jim_crow_laws(Start1,End1), (End1-Start1)>=14, Start is (Start1+14), End is (End1+1).

jim_crow_laws_until_argentine_grand_prix_during_14_22_overlap(Start,End) :- jim_crow_laws_last_till_14_22(Start1,End1), argentine_grand_prix(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

jim_crow_laws_until_argentine_grand_prix_during_14_22(Start,End) :- jim_crow_laws(W1,_), jim_crow_laws_until_argentine_grand_prix_during_14_22_overlap(Start1,End1), Start is max((Start1-22),W1), End is (End1-14), Start=<End.

jim_crow_laws_until_argentine_grand_prix_during_14_22_at_1980(Res) :- setof((Start,End),jim_crow_laws_until_argentine_grand_prix_during_14_22(Start,End),AllINtervals), checkvalidity(1980,AllINtervals,Res).

check_query() :- write('Query = jim_crow_laws_until_argentine_grand_prix_during_14_22_at_1980'), (jim_crow_laws_until_argentine_grand_prix_during_14_22_at_1980(true) -> write('\nRes   = true');write('\nRes   = false')).

