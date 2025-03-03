:- include('database.pl').
iraq_war(Start,End) :- begin('iraq_war',_,_,Start), end('iraq_war',_,_,End), Start=<End.

don_t_mess_with_an_angel(Start,End) :- begin('don_t_mess_with_an_angel',_,_,Start), end('don_t_mess_with_an_angel',_,_,End), Start=<End.

iraq_war_last_till_1_7(Start,End) :- iraq_war(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

iraq_war_until_don_t_mess_with_an_angel_during_1_7_overlap(Start,End) :- iraq_war_last_till_1_7(Start1,End1), don_t_mess_with_an_angel(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

iraq_war_until_don_t_mess_with_an_angel_during_1_7(Start,End) :- iraq_war(W1,_), iraq_war_until_don_t_mess_with_an_angel_during_1_7_overlap(Start1,End1), Start is max((Start1-7),W1), End is (End1-1), Start=<End.

iraq_war_until_don_t_mess_with_an_angel_during_1_7_at_2006(Res) :- setof((Start,End),iraq_war_until_don_t_mess_with_an_angel_during_1_7(Start,End),AllINtervals), checkvalidity(2006,AllINtervals,Res).

check_query() :- write('Query = iraq_war_until_don_t_mess_with_an_angel_during_1_7_at_2006'), (iraq_war_until_don_t_mess_with_an_angel_during_1_7_at_2006(true) -> write('\nRes   = true');write('\nRes   = false')).

