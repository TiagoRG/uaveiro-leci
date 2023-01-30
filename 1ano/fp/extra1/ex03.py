# Devolve o número de linhas da matriz M.
def matrows(M):
    return len(M)


# Complete para devolver o número de colunas da matriz M.
def matcols(M):
    return len(M[0])


# Complete a função para devolver uma matriz com m×n zeros.
def matzeros(m, n):
    M = []
    for i in range(m):
        M.append(n * [0])
    return M


def matzerosTEST(m, n):
    M = matzeros(m, n)
    M[0][1] = 1  # should change just 1 element!
    return M


# Complete a função para multiplicar a matriz A pela matriz B.
def matmult(A, B):
    assert matcols(A) == matrows(B)
    C = [[sum(a * b for a, b in zip(A_row, B_col))
          for B_col in zip(*B)]
         for A_row in A]
    return C


def matmultTEST(A, B):
    C = matmult(A, B)
    return A, B, C
