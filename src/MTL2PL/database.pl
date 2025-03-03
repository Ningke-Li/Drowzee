:- include('facts.pl').
% begin('romanticism', 1, 1, 1800).
% end('romanticism', 1, 1, 1900).
checkvalidity(N, [], false). 
checkvalidity(N, [(Start,End)|Tail], true ):- N>=Start, N=<End. 
checkvalidity(N, [(Start,End)|Tail], Res ):- checkvalidity(N, Tail, Res1), Res = Res1.

compute_negatedintervals(N, [], Res):- 
    ( N =< 2024 -> Res = [(N, 2024)|[]]; Res = []).
compute_negatedintervals(N, [(Start, End)|Tail], Res):-
    Start1 is Start-1, 
    End1 is End+1, 
    compute_negatedintervals(End1, Tail, NegatedIntervals), 
    (N =< Start1 -> Res = [(N, Start1) | NegatedIntervals] ; Res = NegatedIntervals). 

append1([], L, L).                     % Base case: appending an empty list to L results in L
append1([H|T], L2, [H|R]) :-            % Recursive case: take the head of the first list
    append1(T, L2, R).                 % Append the tail of the first list to the second list


overlap((Start1, End1), (Start2, End2), []) :- Start1 > End2.
overlap((Start1, End1), (Start2, End2), []) :- Start2 > End1.
overlap((Start1, End1), (Start2, End2), [(OverlapStart, OverlapEnd)|[]]) :-
    % Check if there is an overlap
    Start1 =< End2,
    Start2 =< End1,
    % Calculate the overlapping interval
    OverlapStart is max(Start1, Start2),
    OverlapEnd is min(End1, End2).

overlap_aux((Start1, End1), [], []).
overlap_aux((Start1, End1), [(Start2, End2) | Tail], Res):-
    overlap((Start1, End1), (Start2, End2), Res0), 
    overlap_aux((Start1, End1), Tail, Res1), 
    append1(Res0, Res1, Res).

overlap_two_li([], Li2, []).
overlap_two_li([(Start1, End1) | Tail], Li2, Res):-
    overlap_aux((Start1, End1), Li2, Res0), 
    overlap_two_li(Tail, Li2, Res1), 
    append1(Res0, Res1, Res).

