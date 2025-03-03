:- include('database.pl').
swiss_grand_prix(Start,End) :- begin('swiss_grand_prix',_,_,Start), end('swiss_grand_prix',_,_,End), Start=<End.

finally_swiss_grand_prix_during_10_15(Start,End) :- swiss_grand_prix(Start1,End1), (Start1-15)=<(End1-10), Start is (Start1-15), End is (End1-10), Start=<End.

globally_finally_swiss_grand_prix_during_10_15_during_34_48(Start,End) :- finally_swiss_grand_prix_during_10_15(Start1,End1), Start is (Start1-34), End is (End1-48), Start=<End.

globally_finally_swiss_grand_prix_during_10_15_during_34_48_at_1844(Res) :- setof((Start,End),globally_finally_swiss_grand_prix_during_10_15_during_34_48(Start,End),AllINtervals), checkvalidity(1844,AllINtervals,Res).

check_query() :- write('Query = globally_finally_swiss_grand_prix_during_10_15_during_34_48_at_1844'), (globally_finally_swiss_grand_prix_during_10_15_during_34_48_at_1844(true) -> write('\nRes   = true');write('\nRes   = false')).

