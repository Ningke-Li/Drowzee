:- include('database.pl').
tanzimat(Start,End) :- begin('tanzimat',_,_,Start), end('tanzimat',_,_,End), Start=<End.

finally_tanzimat_during_2_19(Start,End) :- tanzimat(Start1,End1), (Start1-19)=<(End1-2), Start is (Start1-19), End is (End1-2), Start=<End.

finally_tanzimat_during_2_19_at_1822(Res) :- setof((Start,End),finally_tanzimat_during_2_19(Start,End),AllINtervals), checkvalidity(1822,AllINtervals,Res).

check_query() :- write('Query = finally_tanzimat_during_2_19_at_1822'), (finally_tanzimat_during_2_19_at_1822(true) -> write('\nRes   = true');write('\nRes   = false')).

