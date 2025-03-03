:- include('database.pl').
bol_var(Start,End) :- begin('bol_var',_,_,Start), end('bol_var',_,_,End), Start=<End.

globally_bol_var_during_16_129(Start,End) :- bol_var(Start1,End1), Start is (Start1-16), End is (End1-129), Start=<End.

finally_globally_bol_var_during_16_129_during_8_20(Start,End) :- globally_bol_var_during_16_129(Start1,End1), (Start1-20)=<(End1-8), Start is (Start1-20), End is (End1-8), Start=<End.

finally_globally_bol_var_during_16_129_during_8_20_at_1882(Res) :- setof((Start,End),finally_globally_bol_var_during_16_129_during_8_20(Start,End),AllINtervals), checkvalidity(1882,AllINtervals,Res).

check_query() :- write('Query = finally_globally_bol_var_during_16_129_during_8_20_at_1882'), (finally_globally_bol_var_during_16_129_during_8_20_at_1882(true) -> write('\nRes   = true');write('\nRes   = false')).

