:- include('database.pl').
eurovision_song_contest_2013(Start,End) :- begin('eurovision_song_contest_2013',_,_,Start), end('eurovision_song_contest_2013',_,_,End), Start=<End.

compare_eurovision_song_contest_2013(Dir,eurovision_song_contest_2013(Start1,_),eurovision_song_contest_2013(Start2,_)) :- Start1=<Start2.

generate_neg_eurovision_song_contest_2013([]).

generate_neg_eurovision_song_contest_2013([(Start,End) | Tail]) :- assert(neg_eurovision_song_contest_2013(Start,End)), generate_neg_eurovision_song_contest_2013(Tail).

sort_eurovision_song_contest_2013(SortedIntervals) :- findall((Start,End),eurovision_song_contest_2013(Start,End),UnsortedIntervals), predsort(compare_eurovision_song_contest_2013,UnsortedIntervals,SortedIntervals).

generate_neg_eurovision_song_contest_2013_aux() :- sort_eurovision_song_contest_2013(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_eurovision_song_contest_2013(NegatedIntervals).

neg_eurovision_song_contest_2013_at_1246(Res) :- setof((Start,End),neg_eurovision_song_contest_2013(Start,End),AllINtervals), checkvalidity(1246,AllINtervals,Res).

check_query() :- write('Query = neg_eurovision_song_contest_2013_at_1246'), (neg_eurovision_song_contest_2013_at_1246(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_eurovision_song_contest_2013_aux().

