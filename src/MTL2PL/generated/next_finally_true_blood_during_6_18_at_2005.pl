:- include('database.pl').
true_blood(Start,End) :- begin('true_blood',_,_,Start), end('true_blood',_,_,End), Start=<End.

finally_true_blood_during_6_18(Start,End) :- true_blood(Start1,End1), (Start1-18)=<(End1-6), Start is (Start1-18), End is (End1-6), Start=<End.

next_finally_true_blood_during_6_18(Start,End) :- finally_true_blood_during_6_18(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_true_blood_during_6_18_at_2005(Res) :- setof((Start,End),next_finally_true_blood_during_6_18(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = next_finally_true_blood_during_6_18_at_2005'), (next_finally_true_blood_during_6_18_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).

