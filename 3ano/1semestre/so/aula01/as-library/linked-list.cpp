#include <assert.h>
#include <errno.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "linked-list.h"

/*******************************************************/

SllNode *sllDestroy(SllNode *list) { return list; }

/*******************************************************/

void sllPrint(SllNode *list, FILE *fout) {
    assert(fout != NULL);
    assert(list != NULL);

    fprintf(fout, "List:\n");
    while (list != NULL) {
        fprintf(fout, "  %u: %s\n", list->reg.nmec, list->reg.name);
        list = list->next;
    }
}

/*******************************************************/

SllNode *sllInsert(SllNode *list, uint32_t nmec, const char *name) {
    assert(name != NULL && name[0] != '\0');
    assert(!sllExists(list, nmec));

    if (nmec == 0) return list;

    if (list == NULL || list->reg.nmec > nmec) {
        SllNode *newNode = (SllNode *)malloc(sizeof(SllNode));
        assert(newNode != NULL);

        newNode->reg.nmec = nmec;
        size_t nameSize = 0;
        while (name[nameSize++] != '\0');
        newNode->reg.name = (char *)malloc(nameSize);
        assert(newNode->reg.name != NULL);
        for (size_t i = 0; i < nameSize; i++)
            newNode->reg.name[i] = name[i];
        newNode->next = list;

        return newNode;
    }

    list->next = sllInsert(list->next, nmec, name);
    return list;
}

/*******************************************************/

bool sllExists(SllNode *list, uint32_t nmec) {
    if (list == NULL) return false;
    return list->reg.nmec == nmec || sllExists(list->next, nmec);
}

/*******************************************************/

SllNode *sllRemove(SllNode *list, uint32_t nmec) {
    assert(list != NULL);
    assert(sllExists(list, nmec));

    if (list->reg.nmec == nmec) {
        SllNode *next = list->next;
        free(list);
        return next;
    } else return sllRemove(list->next, nmec);
}

/*******************************************************/

const char *sllGetName(SllNode *list, uint32_t nmec) {
    assert(list != NULL);
    assert(sllExists(list, nmec));

    return list->reg.nmec == nmec ? list->reg.name : sllGetName(list->next, nmec);
}

/*******************************************************/

SllNode *sllLoad(SllNode *list, FILE *fin, bool *ok) {
    assert(fin != NULL);

    if (ok != NULL)
        *ok = false; // load failure

    if (list == NULL) {
        list = (SllNode *)malloc(sizeof(SllNode));
        assert(list != NULL);
        list->next = NULL;
    }

    uint32_t nmec;
    char name[100];
    while(fscanf(fin, "%d;%[A-Za-z ]\n", &nmec, name) != EOF) {
        if (errno == EINVAL || errno == EBADF || errno == EIO || errno == EPERM || errno == EPIPE || errno == EINTR) {
            fprintf(stderr, "Error reading file: %s\n", strerror(errno));
            return list;
        }
        if (nmec == 0 || name[0] == '\0') {
            continue;
        }
        sllInsert(list, nmec, name);
    }

    *ok = true;
    return list;
}

/*******************************************************/
