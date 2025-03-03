:- include('database.pl').
carinha_de_anjo(Start,End) :- begin('carinha_de_anjo',_,_,Start), end('carinha_de_anjo',_,_,End), Start=<End.

globally_carinha_de_anjo_during_1_2(Start,End) :- carinha_de_anjo(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_carinha_de_anjo_during_1_2_at_2000(Res) :- setof((Start,End),globally_carinha_de_anjo_during_1_2(Start,End),AllINtervals), checkvalidity(2000,AllINtervals,Res).

check_query() :- write('Query = globally_carinha_de_anjo_during_1_2_at_2000'), (globally_carinha_de_anjo_during_1_2_at_2000(true) -> write('\nRes   = true');write('\nRes   = false')).

