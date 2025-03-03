:- include('database.pl').
muhte_em_y_zy_l__k_sem(Start,End) :- begin('muhte_em_y_zy_l__k_sem',_,_,Start), end('muhte_em_y_zy_l__k_sem',_,_,End), Start=<End.

next_muhte_em_y_zy_l__k_sem(Start,End) :- muhte_em_y_zy_l__k_sem(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_muhte_em_y_zy_l__k_sem_at_2020(Res) :- setof((Start,End),next_muhte_em_y_zy_l__k_sem(Start,End),AllINtervals), checkvalidity(2020,AllINtervals,Res).

check_query() :- write('Query = next_muhte_em_y_zy_l__k_sem_at_2020'), (next_muhte_em_y_zy_l__k_sem_at_2020(true) -> write('\nRes   = true');write('\nRes   = false')).

