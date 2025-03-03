:- include('database.pl').
totally_spies_(Start,End) :- begin('totally_spies_',_,_,Start), end('totally_spies_',_,_,End), Start=<End.

finally_totally_spies__during_2_16(Start,End) :- totally_spies_(Start1,End1), (Start1-16)=<(End1-2), Start is (Start1-16), End is (End1-2), Start=<End.

globally_finally_totally_spies__during_2_16_during_1_26(Start,End) :- finally_totally_spies__during_2_16(Start1,End1), Start is (Start1-1), End is (End1-26), Start=<End.

globally_finally_totally_spies__during_2_16_during_1_26_at_1969(Res) :- setof((Start,End),globally_finally_totally_spies__during_2_16_during_1_26(Start,End),AllINtervals), checkvalidity(1969,AllINtervals,Res).

check_query() :- write('Query = globally_finally_totally_spies__during_2_16_during_1_26_at_1969'), (globally_finally_totally_spies__during_2_16_during_1_26_at_1969(true) -> write('\nRes   = true');write('\nRes   = false')).

