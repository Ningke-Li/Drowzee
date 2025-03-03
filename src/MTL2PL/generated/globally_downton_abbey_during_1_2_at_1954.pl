:- include('database.pl').
downton_abbey(Start,End) :- begin('downton_abbey',_,_,Start), end('downton_abbey',_,_,End), Start=<End.

globally_downton_abbey_during_1_2(Start,End) :- downton_abbey(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_downton_abbey_during_1_2_at_1954(Res) :- setof((Start,End),globally_downton_abbey_during_1_2(Start,End),AllINtervals), checkvalidity(1954,AllINtervals,Res).

check_query() :- write('Query = globally_downton_abbey_during_1_2_at_1954'), (globally_downton_abbey_during_1_2_at_1954(true) -> write('\nRes   = true');write('\nRes   = false')).

