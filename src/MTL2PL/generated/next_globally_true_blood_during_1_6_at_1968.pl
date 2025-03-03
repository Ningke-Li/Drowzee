:- include('database.pl').
true_blood(Start,End) :- begin('true_blood',_,_,Start), end('true_blood',_,_,End), Start=<End.

globally_true_blood_during_1_6(Start,End) :- true_blood(Start1,End1), Start is (Start1-1), End is (End1-6), Start=<End.

next_globally_true_blood_during_1_6(Start,End) :- globally_true_blood_during_1_6(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_true_blood_during_1_6_at_1968(Res) :- setof((Start,End),next_globally_true_blood_during_1_6(Start,End),AllINtervals), checkvalidity(1968,AllINtervals,Res).

check_query() :- write('Query = next_globally_true_blood_during_1_6_at_1968'), (next_globally_true_blood_during_1_6_at_1968(true) -> write('\nRes   = true');write('\nRes   = false')).

