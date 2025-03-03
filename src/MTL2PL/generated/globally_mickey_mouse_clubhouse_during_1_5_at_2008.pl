:- include('database.pl').
mickey_mouse_clubhouse(Start,End) :- begin('mickey_mouse_clubhouse',_,_,Start), end('mickey_mouse_clubhouse',_,_,End), Start=<End.

globally_mickey_mouse_clubhouse_during_1_5(Start,End) :- mickey_mouse_clubhouse(Start1,End1), Start is (Start1-1), End is (End1-5), Start=<End.

globally_mickey_mouse_clubhouse_during_1_5_at_2008(Res) :- setof((Start,End),globally_mickey_mouse_clubhouse_during_1_5(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = globally_mickey_mouse_clubhouse_during_1_5_at_2008'), (globally_mickey_mouse_clubhouse_during_1_5_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).

