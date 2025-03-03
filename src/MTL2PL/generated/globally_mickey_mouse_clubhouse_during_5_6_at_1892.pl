:- include('database.pl').
mickey_mouse_clubhouse(Start,End) :- begin('mickey_mouse_clubhouse',_,_,Start), end('mickey_mouse_clubhouse',_,_,End), Start=<End.

globally_mickey_mouse_clubhouse_during_5_6(Start,End) :- mickey_mouse_clubhouse(Start1,End1), Start is (Start1-5), End is (End1-6), Start=<End.

globally_mickey_mouse_clubhouse_during_5_6_at_1892(Res) :- setof((Start,End),globally_mickey_mouse_clubhouse_during_5_6(Start,End),AllINtervals), checkvalidity(1892,AllINtervals,Res).

check_query() :- write('Query = globally_mickey_mouse_clubhouse_during_5_6_at_1892'), (globally_mickey_mouse_clubhouse_during_5_6_at_1892(true) -> write('\nRes   = true');write('\nRes   = false')).

