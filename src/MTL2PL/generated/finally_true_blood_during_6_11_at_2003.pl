:- include('database.pl').
true_blood(Start,End) :- begin('true_blood',_,_,Start), end('true_blood',_,_,End), Start=<End.

finally_true_blood_during_6_11(Start,End) :- true_blood(Start1,End1), (Start1-11)=<(End1-6), Start is (Start1-11), End is (End1-6), Start=<End.

finally_true_blood_during_6_11_at_2003(Res) :- setof((Start,End),finally_true_blood_during_6_11(Start,End),AllINtervals), checkvalidity(2003,AllINtervals,Res).

check_query() :- write('Query = finally_true_blood_during_6_11_at_2003'), (finally_true_blood_during_6_11_at_2003(true) -> write('\nRes   = true');write('\nRes   = false')).

