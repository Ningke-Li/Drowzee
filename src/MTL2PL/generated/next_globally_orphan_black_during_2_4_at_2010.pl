:- include('database.pl').
orphan_black(Start,End) :- begin('orphan_black',_,_,Start), end('orphan_black',_,_,End), Start=<End.

globally_orphan_black_during_2_4(Start,End) :- orphan_black(Start1,End1), Start is (Start1-2), End is (End1-4), Start=<End.

next_globally_orphan_black_during_2_4(Start,End) :- globally_orphan_black_during_2_4(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_orphan_black_during_2_4_at_2010(Res) :- setof((Start,End),next_globally_orphan_black_during_2_4(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = next_globally_orphan_black_during_2_4_at_2010'), (next_globally_orphan_black_during_2_4_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).

