# Not passing codecheck tests although not sure why :skull:

def hondt(votes, numseats):
    v = [vote for vote in votes]
    seats = [0] * len(votes)
    for i in range(numseats):
        maxvotes = max(votes)
        maxindex = votes.index(maxvotes)
        maxvotes2 = max(votes[maxindex:])
        maxindex2 = votes.index(maxvotes2)
        if (maxvotes == maxvotes2) and (v[maxindex] < v[maxindex2]):
            seats[maxindex2] += 1
            votes[maxindex2] = maxvotes2 / (seats[maxindex2] + 1)
        else:
            seats[maxindex] += 1
            votes[maxindex] = maxvotes / (seats[maxindex] + 1)
    return seats
