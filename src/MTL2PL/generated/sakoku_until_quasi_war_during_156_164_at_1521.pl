:- include('database.pl').
sakoku(Start,End) :- begin('sakoku',_,_,Start), end('sakoku',_,_,End), Start=<End.

quasi_war(Start,End) :- begin('quasi_war',_,_,Start), end('quasi_war',_,_,End), Start=<End.

sakoku_last_till_156_164(Start,End) :- sakoku(Start1,End1), (End1-Start1)>=156, Start is (Start1+156), End is (End1+1).

sakoku_until_quasi_war_during_156_164_overlap(Start,End) :- sakoku_last_till_156_164(Start1,End1), quasi_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

sakoku_until_quasi_war_during_156_164(Start,End) :- sakoku(W1,_), sakoku_until_quasi_war_during_156_164_overlap(Start1,End1), Start is max((Start1-164),W1), End is (End1-156), Start=<End.

sakoku_until_quasi_war_during_156_164_at_1521(Res) :- setof((Start,End),sakoku_until_quasi_war_during_156_164(Start,End),AllINtervals), checkvalidity(1521,AllINtervals,Res).

check_query() :- write('Query = sakoku_until_quasi_war_during_156_164_at_1521'), (sakoku_until_quasi_war_during_156_164_at_1521(true) -> write('\nRes   = true');write('\nRes   = false')).

