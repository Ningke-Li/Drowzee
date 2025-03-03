:- include('database.pl').
totally_spies_(Start,End) :- begin('totally_spies_',_,_,Start), end('totally_spies_',_,_,End), Start=<End.

v(Start,End) :- begin('v',_,_,Start), end('v',_,_,End), Start=<End.

totally_spies__last_till_3_11(Start,End) :- totally_spies_(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

totally_spies__until_v_during_3_11_overlap(Start,End) :- totally_spies__last_till_3_11(Start1,End1), v(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

totally_spies__until_v_during_3_11(Start,End) :- totally_spies_(W1,_), totally_spies__until_v_during_3_11_overlap(Start1,End1), Start is max((Start1-11),W1), End is (End1-3), Start=<End.

totally_spies__until_v_during_3_11_at_1915(Res) :- setof((Start,End),totally_spies__until_v_during_3_11(Start,End),AllINtervals), checkvalidity(1915,AllINtervals,Res).

check_query() :- write('Query = totally_spies__until_v_during_3_11_at_1915'), (totally_spies__until_v_during_3_11_at_1915(true) -> write('\nRes   = true');write('\nRes   = false')).

