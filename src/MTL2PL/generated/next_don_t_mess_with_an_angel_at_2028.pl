:- include('database.pl').
don_t_mess_with_an_angel(Start,End) :- begin('don_t_mess_with_an_angel',_,_,Start), end('don_t_mess_with_an_angel',_,_,End), Start=<End.

next_don_t_mess_with_an_angel(Start,End) :- don_t_mess_with_an_angel(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_don_t_mess_with_an_angel_at_2028(Res) :- setof((Start,End),next_don_t_mess_with_an_angel(Start,End),AllINtervals), checkvalidity(2028,AllINtervals,Res).

check_query() :- write('Query = next_don_t_mess_with_an_angel_at_2028'), (next_don_t_mess_with_an_angel_at_2028(true) -> write('\nRes   = true');write('\nRes   = false')).

