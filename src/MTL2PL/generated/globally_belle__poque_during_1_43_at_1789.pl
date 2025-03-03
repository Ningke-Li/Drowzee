:- include('database.pl').
belle__poque(Start,End) :- begin('belle__poque',_,_,Start), end('belle__poque',_,_,End), Start=<End.

globally_belle__poque_during_1_43(Start,End) :- belle__poque(Start1,End1), Start is (Start1-1), End is (End1-43), Start=<End.

globally_belle__poque_during_1_43_at_1789(Res) :- setof((Start,End),globally_belle__poque_during_1_43(Start,End),AllINtervals), checkvalidity(1789,AllINtervals,Res).

check_query() :- write('Query = globally_belle__poque_during_1_43_at_1789'), (globally_belle__poque_during_1_43_at_1789(true) -> write('\nRes   = true');write('\nRes   = false')).

