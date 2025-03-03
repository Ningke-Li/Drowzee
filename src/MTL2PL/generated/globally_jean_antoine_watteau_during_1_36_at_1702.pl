:- include('database.pl').
jean_antoine_watteau(Start,End) :- begin('jean_antoine_watteau',_,_,Start), end('jean_antoine_watteau',_,_,End), Start=<End.

globally_jean_antoine_watteau_during_1_36(Start,End) :- jean_antoine_watteau(Start1,End1), Start is (Start1-1), End is (End1-36), Start=<End.

globally_jean_antoine_watteau_during_1_36_at_1702(Res) :- setof((Start,End),globally_jean_antoine_watteau_during_1_36(Start,End),AllINtervals), checkvalidity(1702,AllINtervals,Res).

check_query() :- write('Query = globally_jean_antoine_watteau_during_1_36_at_1702'), (globally_jean_antoine_watteau_during_1_36_at_1702(true) -> write('\nRes   = true');write('\nRes   = false')).

