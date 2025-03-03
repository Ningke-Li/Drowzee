:- include('database.pl').
second_french_intervention_in_mexico(Start,End) :- begin('second_french_intervention_in_mexico',_,_,Start), end('second_french_intervention_in_mexico',_,_,End), Start=<End.

globally_second_french_intervention_in_mexico_during_1_6(Start,End) :- second_french_intervention_in_mexico(Start1,End1), Start is (Start1-1), End is (End1-6), Start=<End.

globally_second_french_intervention_in_mexico_during_1_6_at_1860(Res) :- setof((Start,End),globally_second_french_intervention_in_mexico_during_1_6(Start,End),AllINtervals), checkvalidity(1860,AllINtervals,Res).

check_query() :- write('Query = globally_second_french_intervention_in_mexico_during_1_6_at_1860'), (globally_second_french_intervention_in_mexico_during_1_6_at_1860(true) -> write('\nRes   = true');write('\nRes   = false')).

