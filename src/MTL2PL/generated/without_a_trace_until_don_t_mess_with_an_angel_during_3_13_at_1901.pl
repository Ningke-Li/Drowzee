:- include('database.pl').
without_a_trace(Start,End) :- begin('without_a_trace',_,_,Start), end('without_a_trace',_,_,End), Start=<End.

don_t_mess_with_an_angel(Start,End) :- begin('don_t_mess_with_an_angel',_,_,Start), end('don_t_mess_with_an_angel',_,_,End), Start=<End.

without_a_trace_last_till_3_13(Start,End) :- without_a_trace(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

without_a_trace_until_don_t_mess_with_an_angel_during_3_13_overlap(Start,End) :- without_a_trace_last_till_3_13(Start1,End1), don_t_mess_with_an_angel(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

without_a_trace_until_don_t_mess_with_an_angel_during_3_13(Start,End) :- without_a_trace(W1,_), without_a_trace_until_don_t_mess_with_an_angel_during_3_13_overlap(Start1,End1), Start is max((Start1-13),W1), End is (End1-3), Start=<End.

without_a_trace_until_don_t_mess_with_an_angel_during_3_13_at_1901(Res) :- setof((Start,End),without_a_trace_until_don_t_mess_with_an_angel_during_3_13(Start,End),AllINtervals), checkvalidity(1901,AllINtervals,Res).

check_query() :- write('Query = without_a_trace_until_don_t_mess_with_an_angel_during_3_13_at_1901'), (without_a_trace_until_don_t_mess_with_an_angel_during_3_13_at_1901(true) -> write('\nRes   = true');write('\nRes   = false')).

