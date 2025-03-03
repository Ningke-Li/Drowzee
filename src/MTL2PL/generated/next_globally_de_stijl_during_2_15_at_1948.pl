:- include('database.pl').
de_stijl(Start,End) :- begin('de_stijl',_,_,Start), end('de_stijl',_,_,End), Start=<End.

globally_de_stijl_during_2_15(Start,End) :- de_stijl(Start1,End1), Start is (Start1-2), End is (End1-15), Start=<End.

next_globally_de_stijl_during_2_15(Start,End) :- globally_de_stijl_during_2_15(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_de_stijl_during_2_15_at_1948(Res) :- setof((Start,End),next_globally_de_stijl_during_2_15(Start,End),AllINtervals), checkvalidity(1948,AllINtervals,Res).

check_query() :- write('Query = next_globally_de_stijl_during_2_15_at_1948'), (next_globally_de_stijl_during_2_15_at_1948(true) -> write('\nRes   = true');write('\nRes   = false')).

