:- include('database.pl').
man_vs__wild(Start,End) :- begin('man_vs__wild',_,_,Start), end('man_vs__wild',_,_,End), Start=<End.

globally_man_vs__wild_during_1_3(Start,End) :- man_vs__wild(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

next_globally_man_vs__wild_during_1_3(Start,End) :- globally_man_vs__wild_during_1_3(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_man_vs__wild_during_1_3_at_1892(Res) :- setof((Start,End),next_globally_man_vs__wild_during_1_3(Start,End),AllINtervals), checkvalidity(1892,AllINtervals,Res).

check_query() :- write('Query = next_globally_man_vs__wild_during_1_3_at_1892'), (next_globally_man_vs__wild_during_1_3_at_1892(true) -> write('\nRes   = true');write('\nRes   = false')).

