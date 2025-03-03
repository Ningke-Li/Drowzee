:- include('database.pl').
second_french_intervention_in_mexico(Start,End) :- begin('second_french_intervention_in_mexico',_,_,Start), end('second_french_intervention_in_mexico',_,_,End), Start=<End.

next_second_french_intervention_in_mexico(Start,End) :- second_french_intervention_in_mexico(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_second_french_intervention_in_mexico_at_1893(Res) :- setof((Start,End),next_second_french_intervention_in_mexico(Start,End),AllINtervals), checkvalidity(1893,AllINtervals,Res).

check_query() :- write('Query = next_second_french_intervention_in_mexico_at_1893'), (next_second_french_intervention_in_mexico_at_1893(true) -> write('\nRes   = true');write('\nRes   = false')).

