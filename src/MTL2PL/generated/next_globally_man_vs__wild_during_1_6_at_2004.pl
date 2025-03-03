:- include('database.pl').
man_vs__wild(Start,End) :- begin('man_vs__wild',_,_,Start), end('man_vs__wild',_,_,End), Start=<End.

globally_man_vs__wild_during_1_6(Start,End) :- man_vs__wild(Start1,End1), Start is (Start1-1), End is (End1-6), Start=<End.

next_globally_man_vs__wild_during_1_6(Start,End) :- globally_man_vs__wild_during_1_6(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_man_vs__wild_during_1_6_at_2004(Res) :- setof((Start,End),next_globally_man_vs__wild_during_1_6(Start,End),AllINtervals), checkvalidity(2004,AllINtervals,Res).

check_query() :- write('Query = next_globally_man_vs__wild_during_1_6_at_2004'), (next_globally_man_vs__wild_during_1_6_at_2004(true) -> write('\nRes   = true');write('\nRes   = false')).

