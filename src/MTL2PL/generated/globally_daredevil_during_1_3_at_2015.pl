:- include('database.pl').
daredevil(Start,End) :- begin('daredevil',_,_,Start), end('daredevil',_,_,End), Start=<End.

globally_daredevil_during_1_3(Start,End) :- daredevil(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

globally_daredevil_during_1_3_at_2015(Res) :- setof((Start,End),globally_daredevil_during_1_3(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = globally_daredevil_during_1_3_at_2015'), (globally_daredevil_during_1_3_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).

