:- include('database.pl').
dirili___ertu_rul(Start,End) :- begin('dirili___ertu_rul',_,_,Start), end('dirili___ertu_rul',_,_,End), Start=<End.

finally_dirili___ertu_rul_during_7_13(Start,End) :- dirili___ertu_rul(Start1,End1), (Start1-13)=<(End1-7), Start is (Start1-13), End is (End1-7), Start=<End.

next_finally_dirili___ertu_rul_during_7_13(Start,End) :- finally_dirili___ertu_rul_during_7_13(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_dirili___ertu_rul_during_7_13_at_1955(Res) :- setof((Start,End),next_finally_dirili___ertu_rul_during_7_13(Start,End),AllINtervals), checkvalidity(1955,AllINtervals,Res).

check_query() :- write('Query = next_finally_dirili___ertu_rul_during_7_13_at_1955'), (next_finally_dirili___ertu_rul_during_7_13_at_1955(true) -> write('\nRes   = true');write('\nRes   = false')).

