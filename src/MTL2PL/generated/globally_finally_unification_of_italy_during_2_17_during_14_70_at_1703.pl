:- include('database.pl').
unification_of_italy(Start,End) :- begin('unification_of_italy',_,_,Start), end('unification_of_italy',_,_,End), Start=<End.

finally_unification_of_italy_during_2_17(Start,End) :- unification_of_italy(Start1,End1), (Start1-17)=<(End1-2), Start is (Start1-17), End is (End1-2), Start=<End.

globally_finally_unification_of_italy_during_2_17_during_14_70(Start,End) :- finally_unification_of_italy_during_2_17(Start1,End1), Start is (Start1-14), End is (End1-70), Start=<End.

globally_finally_unification_of_italy_during_2_17_during_14_70_at_1703(Res) :- setof((Start,End),globally_finally_unification_of_italy_during_2_17_during_14_70(Start,End),AllINtervals), checkvalidity(1703,AllINtervals,Res).

check_query() :- write('Query = globally_finally_unification_of_italy_during_2_17_during_14_70_at_1703'), (globally_finally_unification_of_italy_during_2_17_during_14_70_at_1703(true) -> write('\nRes   = true');write('\nRes   = false')).

