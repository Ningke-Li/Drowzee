:- include('database.pl').
jean_antoine_watteau(Start,End) :- begin('jean_antoine_watteau',_,_,Start), end('jean_antoine_watteau',_,_,End), Start=<End.

globally_jean_antoine_watteau_during_7_35(Start,End) :- jean_antoine_watteau(Start1,End1), Start is (Start1-7), End is (End1-35), Start=<End.

globally_jean_antoine_watteau_during_7_35_at_1681(Res) :- setof((Start,End),globally_jean_antoine_watteau_during_7_35(Start,End),AllINtervals), checkvalidity(1681,AllINtervals,Res).

check_query() :- write('Query = globally_jean_antoine_watteau_during_7_35_at_1681'), (globally_jean_antoine_watteau_during_7_35_at_1681(true) -> write('\nRes   = true');write('\nRes   = false')).

