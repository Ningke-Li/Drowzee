:- include('database.pl').
luke_cage(Start,End) :- begin('luke_cage',_,_,Start), end('luke_cage',_,_,End), Start=<End.

globally_luke_cage_during_1_2(Start,End) :- luke_cage(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_luke_cage_during_1_2_at_1904(Res) :- setof((Start,End),globally_luke_cage_during_1_2(Start,End),AllINtervals), checkvalidity(1904,AllINtervals,Res).

check_query() :- write('Query = globally_luke_cage_during_1_2_at_1904'), (globally_luke_cage_during_1_2_at_1904(true) -> write('\nRes   = true');write('\nRes   = false')).

