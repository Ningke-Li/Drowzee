:- include('database.pl').
dirili___ertu_rul(Start,End) :- begin('dirili___ertu_rul',_,_,Start), end('dirili___ertu_rul',_,_,End), Start=<End.

globally_dirili___ertu_rul_during_1_3(Start,End) :- dirili___ertu_rul(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

globally_dirili___ertu_rul_during_1_3_at_2016(Res) :- setof((Start,End),globally_dirili___ertu_rul_during_1_3(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = globally_dirili___ertu_rul_during_1_3_at_2016'), (globally_dirili___ertu_rul_during_1_3_at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).

