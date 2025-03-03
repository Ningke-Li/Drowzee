:- include('database.pl').
downton_abbey(Start,End) :- begin('downton_abbey',_,_,Start), end('downton_abbey',_,_,End), Start=<End.

finally_downton_abbey_during_2_11(Start,End) :- downton_abbey(Start1,End1), (Start1-11)=<(End1-2), Start is (Start1-11), End is (End1-2), Start=<End.

finally_downton_abbey_during_2_11_at_2008(Res) :- setof((Start,End),finally_downton_abbey_during_2_11(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = finally_downton_abbey_during_2_11_at_2008'), (finally_downton_abbey_during_2_11_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).

