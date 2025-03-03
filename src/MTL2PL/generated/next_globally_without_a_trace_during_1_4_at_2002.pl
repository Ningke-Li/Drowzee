:- include('database.pl').
without_a_trace(Start,End) :- begin('without_a_trace',_,_,Start), end('without_a_trace',_,_,End), Start=<End.

globally_without_a_trace_during_1_4(Start,End) :- without_a_trace(Start1,End1), Start is (Start1-1), End is (End1-4), Start=<End.

next_globally_without_a_trace_during_1_4(Start,End) :- globally_without_a_trace_during_1_4(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_without_a_trace_during_1_4_at_2002(Res) :- setof((Start,End),next_globally_without_a_trace_during_1_4(Start,End),AllINtervals), checkvalidity(2002,AllINtervals,Res).

check_query() :- write('Query = next_globally_without_a_trace_during_1_4_at_2002'), (next_globally_without_a_trace_during_1_4_at_2002(true) -> write('\nRes   = true');write('\nRes   = false')).

