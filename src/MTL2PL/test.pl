

:- include('database.pl').

interval(Start, End) :- begin('ev3', _,_,Start), end('ev3', _,_,End).




% Comparator to sort intervals based on their starting point
compare_intervals(Dir, interval(Start1, _), interval(Start2, _)) :-
    Start1 =< Start2.

compute_negatedIntervals(N, [], Res):- 
    ( N =< 2024 -> Res = [(N, 2024)|[]]; Res = []).

compute_negatedIntervals(N, [(Start, End)|Tail], Res):-
    Start1 is Start-1, 
    End1 is End+1, 
    compute_negatedIntervals(End1, Tail, NegatedIntervals), 
    (N =< Start1 -> Res = [(N, Start1) | NegatedIntervals] ; Res = NegatedIntervals). 


% Base case: If the list is empty, do nothing.
generate_facts([]).

% Recursive case: Assert the head of the list and process the tail.
generate_facts([(Start, End) | Tail]) :-
    assert(neg_interval(Start, End)),  % Assert the current head as a fact.
    generate_facts(Tail).  % Recursively call for the tail.

% Sort intervals using the comparator
sort_intervals(SortedIntervals) :-
    findall((S,E), interval(S,E), UnsortedIntervals), 
    predsort(compare_intervals, UnsortedIntervals, SortedIntervals).

geenrate_neg_interval():- 
    sort_intervals(SortedIntervals), 
    compute_negatedIntervals(0, SortedIntervals, NegatedIntervals), 
    generate_facts(NegatedIntervals).

?- geenrate_neg_interval().




% AP:  2000, Atom(iraq_war)
iraq_war(Start, End) :- begin('iraq_war', _,_,Start), end('iraq_war', _,_,End).

ev2(Start, End) :- begin('ev2', _,_,Start), end('ev2', _,_,End).


% Disjunction 

% Base case: If the list is empty, do nothing.
generate_facts_iraq_war_or_ev2([]).

% Recursive case: Assert the head of the list and process the tail.
generate_facts_iraq_war_or_ev2([(Start, End) | Tail]) :-
    assert(iraq_war_or_ev2(Start, End)),  % Assert the current head as a fact.
    generate_facts_iraq_war_or_ev2(Tail).  % Recursively call for the tail.


iraq_war_or_ev2_aux():- 
    findall((S,E), iraq_war(S,E), Interval1), 
    findall((S,E), ev2(S,E), Interval2), 
    append1(Interval1, Interval2, Interval), 
    generate_facts_iraq_war_or_ev2(Interval).

?- iraq_war_or_ev2_aux().

% Conjunction 

% Base case: If the list is empty, do nothing.
generate_facts_iraq_war_and_ev2([]).

% Recursive case: Assert the head of the list and process the tail.
generate_facts_iraq_war_and_ev2([(Start, End) | Tail]) :-
    assert(iraq_war_and_ev2(Start, End)),  % Assert the current head as a fact.
    generate_facts_iraq_war_and_ev2(Tail).  % Recursively call for the tail.

iraq_war_and_ev2_aux():- 
    findall((S,E), iraq_war(S,E), Interval1), 
    findall((S,E), ev2(S,E), Interval2), 
    overlap_two_li(Interval1, Interval2, Interval), 
    generate_facts_iraq_war_and_ev2(Interval).

?- iraq_war_and_ev2_aux().

% Base case: If the list is empty, do nothing.
generate_facts_iraq_war_and_ev2([]).

% Recursive case: Assert the head of the list and process the tail.
generate_facts_iraq_war_and_ev2([(Start, End) | Tail]) :-
    assert(iraq_war_and_ev2(Start, End)),  % Assert the current head as a fact.
    generate_facts_iraq_war_and_ev2(Tail).  % Recursively call for the tail.


iraq_war_and_ev2_aux():- 
    findall((S,E), iraq_war(S,E), Interval1), 
    findall((S,E), ev2(S,E), Interval2), 
    find_overlaps(Interval1, Interval2, Interval), 
    generate_facts_iraq_war_and_ev2(Interval).

?- iraq_war_and_ev2_aux().


% Until
ev1_last_till_10_35(Start, End):- iraq_war(W1, W2), W2-W1>=10, Start is W1+10, End is W2+1. 
 
overlap(Start, End) :-
    ev1_last_till_10_35(Start1, End1),
    ev2(Start2, End2),
    Start is max(Start1, Start2),
    End is min(End1, End2),
    Start < End. 

ev1_until_ev2_10_35(Start, End):- 
    iraq_war(W1, _), 
    overlap(Start1, End1), Start is max(Start1-35, W1), End is End1-10. 

%--------2000-------------------2050
%[10, 35]

%                   2025 ---------------------2100

% Finally: 1990, Finally([10, 12],iraq_war)
finally_iraq_war_10_12(Start, End):- iraq_war(Start1, End1), Start is Start1-12, End is End1-10. 

% Next: 1990, Next(iraq_war)
next_iraq_war_10_12(Start, End):- iraq_war(Start1, End1), Start is Start1-1, End is End1-1.

% Globally: 1990, Globally([10, 12],iraq_war)
globally_iraq_war_10_12(Start, End):-iraq_war(Start1, End1), Start1-10=< End1-12, Start is  Start1-10, End is  End1-12. 
