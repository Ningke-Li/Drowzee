:- include('database.pl').
true_blood(Start,End) :- begin('true_blood',_,_,Start), end('true_blood',_,_,End), Start=<End.

globally_true_blood_during_2_6(Start,End) :- true_blood(Start1,End1), Start is (Start1-2), End is (End1-6), Start=<End.

finally_globally_true_blood_during_2_6_during_4_17(Start,End) :- globally_true_blood_during_2_6(Start1,End1), (Start1-17)=<(End1-4), Start is (Start1-17), End is (End1-4), Start=<End.

finally_globally_true_blood_during_2_6_during_4_17_at_1982(Res) :- setof((Start,End),finally_globally_true_blood_during_2_6_during_4_17(Start,End),AllINtervals), checkvalidity(1982,AllINtervals,Res).

check_query() :- write('Query = finally_globally_true_blood_during_2_6_during_4_17_at_1982'), (finally_globally_true_blood_during_2_6_during_4_17_at_1982(true) -> write('\nRes   = true');write('\nRes   = false')).

