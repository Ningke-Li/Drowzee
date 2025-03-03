:- include('database.pl').
argentine_grand_prix(Start,End) :- begin('argentine_grand_prix',_,_,Start), end('argentine_grand_prix',_,_,End), Start=<End.

globally_argentine_grand_prix_during_6_33(Start,End) :- argentine_grand_prix(Start1,End1), Start is (Start1-6), End is (End1-33), Start=<End.

globally_argentine_grand_prix_during_6_33_at_1950(Res) :- setof((Start,End),globally_argentine_grand_prix_during_6_33(Start,End),AllINtervals), checkvalidity(1950,AllINtervals,Res).

check_query() :- write('Query = globally_argentine_grand_prix_during_6_33_at_1950'), (globally_argentine_grand_prix_during_6_33_at_1950(true) -> write('\nRes   = true');write('\nRes   = false')).

