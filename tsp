import itertools
import math

def tsp(cities):
    # Create a list of all possible orderings of the cities
    permutations = itertools.permutations(range(len(cities)))

    # Calculate the total distance of each ordering
    best_distance = math.inf
    best_ordering = None
    for ordering in permutations:
        distance = 0
        for i in range(len(ordering)):
            current_city = ordering[i]
            next_city = ordering[(i + 1) % len(ordering)]
            distance += math.sqrt((cities[current_city][0] - cities[next_city][0]) ** 2 + (cities[current_city][1] - cities[next_city][1]) ** 2)
        if distance < best_distance:
            best_distance = distance
            best_ordering = ordering

    return (best_ordering, best_distance)


cities = [(0, 0), (1, 1), (2, 2), (3, 3)]
print(tsp(cities))
