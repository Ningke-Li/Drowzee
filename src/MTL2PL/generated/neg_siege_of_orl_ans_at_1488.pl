:- include('database.pl').
siege_of_orl_ans(Start,End) :- begin('siege_of_orl_ans',_,_,Start), end('siege_of_orl_ans',_,_,End), Start=<End.

compare_siege_of_orl_ans(Dir,siege_of_orl_ans(Start1,_),siege_of_orl_ans(Start2,_)) :- Start1=<Start2.

generate_neg_siege_of_orl_ans([]).

generate_neg_siege_of_orl_ans([(Start,End) | Tail]) :- assert(neg_siege_of_orl_ans(Start,End)), generate_neg_siege_of_orl_ans(Tail).

sort_siege_of_orl_ans(SortedIntervals) :- findall((Start,End),siege_of_orl_ans(Start,End),UnsortedIntervals), predsort(compare_siege_of_orl_ans,UnsortedIntervals,SortedIntervals).

generate_neg_siege_of_orl_ans_aux() :- sort_siege_of_orl_ans(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_siege_of_orl_ans(NegatedIntervals).

neg_siege_of_orl_ans_at_1488(Res) :- setof((Start,End),neg_siege_of_orl_ans(Start,End),AllINtervals), checkvalidity(1488,AllINtervals,Res).

check_query() :- write('Query = neg_siege_of_orl_ans_at_1488'), (neg_siege_of_orl_ans_at_1488(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_siege_of_orl_ans_aux().

