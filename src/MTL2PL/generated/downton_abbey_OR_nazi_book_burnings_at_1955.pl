:- include('database.pl').
downton_abbey(Start,End) :- begin('downton_abbey',_,_,Start), end('downton_abbey',_,_,End), Start=<End.

nazi_book_burnings(Start,End) :- begin('nazi_book_burnings',_,_,Start), end('nazi_book_burnings',_,_,End), Start=<End.

generate_facts_downton_abbey_OR_nazi_book_burnings([]) :- assert(downton_abbey_OR_nazi_book_burnings(-1,-1)).

generate_facts_downton_abbey_OR_nazi_book_burnings([(Start,End) | Tail]) :- assert(downton_abbey_OR_nazi_book_burnings(Start,End)), generate_facts_downton_abbey_OR_nazi_book_burnings(Tail).

downton_abbey_OR_nazi_book_burnings_aux() :- findall((Start,End),downton_abbey(Start,End),Interval1), findall((Start,End),nazi_book_burnings(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_downton_abbey_OR_nazi_book_burnings(Interval).

downton_abbey_OR_nazi_book_burnings_at_1955(Res) :- setof((Start,End),downton_abbey_OR_nazi_book_burnings(Start,End),AllINtervals), checkvalidity(1955,AllINtervals,Res).

check_query() :- write('Query = downton_abbey_OR_nazi_book_burnings_at_1955'), (downton_abbey_OR_nazi_book_burnings_at_1955(true) -> write('\nRes   = true');write('\nRes   = false')).
?- downton_abbey_OR_nazi_book_burnings_aux().

