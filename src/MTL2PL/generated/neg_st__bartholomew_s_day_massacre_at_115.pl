:- include('database.pl').
st__bartholomew_s_day_massacre(Start,End) :- begin('st__bartholomew_s_day_massacre',_,_,Start), end('st__bartholomew_s_day_massacre',_,_,End), Start=<End.

compare_st__bartholomew_s_day_massacre(Dir,st__bartholomew_s_day_massacre(Start1,_),st__bartholomew_s_day_massacre(Start2,_)) :- Start1=<Start2.

generate_neg_st__bartholomew_s_day_massacre([]).

generate_neg_st__bartholomew_s_day_massacre([(Start,End) | Tail]) :- assert(neg_st__bartholomew_s_day_massacre(Start,End)), generate_neg_st__bartholomew_s_day_massacre(Tail).

sort_st__bartholomew_s_day_massacre(SortedIntervals) :- findall((Start,End),st__bartholomew_s_day_massacre(Start,End),UnsortedIntervals), predsort(compare_st__bartholomew_s_day_massacre,UnsortedIntervals,SortedIntervals).

generate_neg_st__bartholomew_s_day_massacre_aux() :- sort_st__bartholomew_s_day_massacre(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_st__bartholomew_s_day_massacre(NegatedIntervals).

neg_st__bartholomew_s_day_massacre_at_115(Res) :- setof((Start,End),neg_st__bartholomew_s_day_massacre(Start,End),AllINtervals), checkvalidity(115,AllINtervals,Res).

check_query() :- write('Query = neg_st__bartholomew_s_day_massacre_at_115'), (neg_st__bartholomew_s_day_massacre_at_115(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_st__bartholomew_s_day_massacre_aux().

