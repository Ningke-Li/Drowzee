:- include('database.pl').
muhte_em_y_zy_l__k_sem(Start,End) :- begin('muhte_em_y_zy_l__k_sem',_,_,Start), end('muhte_em_y_zy_l__k_sem',_,_,End), Start=<End.

finally_muhte_em_y_zy_l__k_sem_during_9_11(Start,End) :- muhte_em_y_zy_l__k_sem(Start1,End1), (Start1-11)=<(End1-9), Start is (Start1-11), End is (End1-9), Start=<End.

finally_muhte_em_y_zy_l__k_sem_during_9_11_at_1939(Res) :- setof((Start,End),finally_muhte_em_y_zy_l__k_sem_during_9_11(Start,End),AllINtervals), checkvalidity(1939,AllINtervals,Res).

check_query() :- write('Query = finally_muhte_em_y_zy_l__k_sem_during_9_11_at_1939'), (finally_muhte_em_y_zy_l__k_sem_during_9_11_at_1939(true) -> write('\nRes   = true');write('\nRes   = false')).

