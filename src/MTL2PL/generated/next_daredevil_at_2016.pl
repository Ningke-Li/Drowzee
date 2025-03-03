:- include('database.pl').
daredevil(Start,End) :- begin('daredevil',_,_,Start), end('daredevil',_,_,End), Start=<End.

next_daredevil(Start,End) :- daredevil(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_daredevil_at_2016(Res) :- setof((Start,End),next_daredevil(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = next_daredevil_at_2016'), (next_daredevil_at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).

