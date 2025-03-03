:- include('database.pl').
new_girl(Start,End) :- begin('new_girl',_,_,Start), end('new_girl',_,_,End), Start=<End.

muhte_em_y_zy_l__k_sem(Start,End) :- begin('muhte_em_y_zy_l__k_sem',_,_,Start), end('muhte_em_y_zy_l__k_sem',_,_,End), Start=<End.

generate_facts_new_girl_AND_muhte_em_y_zy_l__k_sem([]) :- assert(new_girl_AND_muhte_em_y_zy_l__k_sem(-1,-1)).

generate_facts_new_girl_AND_muhte_em_y_zy_l__k_sem([(Start,End) | Tail]) :- assert(new_girl_AND_muhte_em_y_zy_l__k_sem(Start,End)), generate_facts_new_girl_AND_muhte_em_y_zy_l__k_sem(Tail).

new_girl_AND_muhte_em_y_zy_l__k_sem_aux() :- findall((Start,End),new_girl(Start,End),Interval1), findall((Start,End),muhte_em_y_zy_l__k_sem(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_new_girl_AND_muhte_em_y_zy_l__k_sem(Interval).

new_girl_AND_muhte_em_y_zy_l__k_sem_at_2008(Res) :- setof((Start,End),new_girl_AND_muhte_em_y_zy_l__k_sem(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = new_girl_AND_muhte_em_y_zy_l__k_sem_at_2008'), (new_girl_AND_muhte_em_y_zy_l__k_sem_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).
?- new_girl_AND_muhte_em_y_zy_l__k_sem_aux().

