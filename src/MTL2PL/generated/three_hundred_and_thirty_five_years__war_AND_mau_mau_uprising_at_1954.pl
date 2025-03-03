:- include('database.pl').
three_hundred_and_thirty_five_years__war(Start,End) :- begin('three_hundred_and_thirty_five_years__war',_,_,Start), end('three_hundred_and_thirty_five_years__war',_,_,End), Start=<End.

mau_mau_uprising(Start,End) :- begin('mau_mau_uprising',_,_,Start), end('mau_mau_uprising',_,_,End), Start=<End.

generate_facts_three_hundred_and_thirty_five_years__war_AND_mau_mau_uprising([]) :- assert(three_hundred_and_thirty_five_years__war_AND_mau_mau_uprising(-1,-1)).

generate_facts_three_hundred_and_thirty_five_years__war_AND_mau_mau_uprising([(Start,End) | Tail]) :- assert(three_hundred_and_thirty_five_years__war_AND_mau_mau_uprising(Start,End)), generate_facts_three_hundred_and_thirty_five_years__war_AND_mau_mau_uprising(Tail).

three_hundred_and_thirty_five_years__war_AND_mau_mau_uprising_aux() :- findall((Start,End),three_hundred_and_thirty_five_years__war(Start,End),Interval1), findall((Start,End),mau_mau_uprising(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_three_hundred_and_thirty_five_years__war_AND_mau_mau_uprising(Interval).

three_hundred_and_thirty_five_years__war_AND_mau_mau_uprising_at_1954(Res) :- setof((Start,End),three_hundred_and_thirty_five_years__war_AND_mau_mau_uprising(Start,End),AllINtervals), checkvalidity(1954,AllINtervals,Res).

check_query() :- write('Query = three_hundred_and_thirty_five_years__war_AND_mau_mau_uprising_at_1954'), (three_hundred_and_thirty_five_years__war_AND_mau_mau_uprising_at_1954(true) -> write('\nRes   = true');write('\nRes   = false')).
?- three_hundred_and_thirty_five_years__war_AND_mau_mau_uprising_aux().

