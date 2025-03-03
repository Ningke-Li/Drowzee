:- include('database.pl').
a_n_t__farm(Start,End) :- begin('a_n_t__farm',_,_,Start), end('a_n_t__farm',_,_,End), Start=<End.

globally_a_n_t__farm_during_1_3(Start,End) :- a_n_t__farm(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

finally_globally_a_n_t__farm_during_1_3_during_5_12(Start,End) :- globally_a_n_t__farm_during_1_3(Start1,End1), (Start1-12)=<(End1-5), Start is (Start1-12), End is (End1-5), Start=<End.

finally_globally_a_n_t__farm_during_1_3_during_5_12_at_2022(Res) :- setof((Start,End),finally_globally_a_n_t__farm_during_1_3_during_5_12(Start,End),AllINtervals), checkvalidity(2022,AllINtervals,Res).

check_query() :- write('Query = finally_globally_a_n_t__farm_during_1_3_during_5_12_at_2022'), (finally_globally_a_n_t__farm_during_1_3_during_5_12_at_2022(true) -> write('\nRes   = true');write('\nRes   = false')).

