:- include('database.pl').
prohibition_in_the_united_states(Start,End) :- begin('prohibition_in_the_united_states',_,_,Start), end('prohibition_in_the_united_states',_,_,End), Start=<End.

finally_prohibition_in_the_united_states_during_9_13(Start,End) :- prohibition_in_the_united_states(Start1,End1), (Start1-13)=<(End1-9), Start is (Start1-13), End is (End1-9), Start=<End.

globally_finally_prohibition_in_the_united_states_during_9_13_during_7_15(Start,End) :- finally_prohibition_in_the_united_states_during_9_13(Start1,End1), Start is (Start1-7), End is (End1-15), Start=<End.

globally_finally_prohibition_in_the_united_states_during_9_13_during_7_15_at_1882(Res) :- setof((Start,End),globally_finally_prohibition_in_the_united_states_during_9_13_during_7_15(Start,End),AllINtervals), checkvalidity(1882,AllINtervals,Res).

check_query() :- write('Query = globally_finally_prohibition_in_the_united_states_during_9_13_during_7_15_at_1882'), (globally_finally_prohibition_in_the_united_states_during_9_13_during_7_15_at_1882(true) -> write('\nRes   = true');write('\nRes   = false')).

