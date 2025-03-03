:- include('database.pl').
philippines_campaign(Start,End) :- begin('philippines_campaign',_,_,Start), end('philippines_campaign',_,_,End), Start=<End.

compare_philippines_campaign(Dir,philippines_campaign(Start1,_),philippines_campaign(Start2,_)) :- Start1=<Start2.

generate_neg_philippines_campaign([]).

generate_neg_philippines_campaign([(Start,End) | Tail]) :- assert(neg_philippines_campaign(Start,End)), generate_neg_philippines_campaign(Tail).

sort_philippines_campaign(SortedIntervals) :- findall((Start,End),philippines_campaign(Start,End),UnsortedIntervals), predsort(compare_philippines_campaign,UnsortedIntervals,SortedIntervals).

generate_neg_philippines_campaign_aux() :- sort_philippines_campaign(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_philippines_campaign(NegatedIntervals).

neg_philippines_campaign_at_525(Res) :- setof((Start,End),neg_philippines_campaign(Start,End),AllINtervals), checkvalidity(525,AllINtervals,Res).

check_query() :- write('Query = neg_philippines_campaign_at_525'), (neg_philippines_campaign_at_525(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_philippines_campaign_aux().

