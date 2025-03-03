:- include('database.pl').
unification_of_italy(Start,End) :- begin('unification_of_italy',_,_,Start), end('unification_of_italy',_,_,End), Start=<End.

greek_drachma(Start,End) :- begin('greek_drachma',_,_,Start), end('greek_drachma',_,_,End), Start=<End.

unification_of_italy_last_till_7_15(Start,End) :- unification_of_italy(Start1,End1), (End1-Start1)>=7, Start is (Start1+7), End is (End1+1).

unification_of_italy_until_greek_drachma_during_7_15_overlap(Start,End) :- unification_of_italy_last_till_7_15(Start1,End1), greek_drachma(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

unification_of_italy_until_greek_drachma_during_7_15(Start,End) :- unification_of_italy(W1,_), unification_of_italy_until_greek_drachma_during_7_15_overlap(Start1,End1), Start is max((Start1-15),W1), End is (End1-7), Start=<End.

unification_of_italy_until_greek_drachma_during_7_15_at_1790(Res) :- setof((Start,End),unification_of_italy_until_greek_drachma_during_7_15(Start,End),AllINtervals), checkvalidity(1790,AllINtervals,Res).

check_query() :- write('Query = unification_of_italy_until_greek_drachma_during_7_15_at_1790'), (unification_of_italy_until_greek_drachma_during_7_15_at_1790(true) -> write('\nRes   = true');write('\nRes   = false')).

