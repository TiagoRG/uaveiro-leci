import sqlite3 as sql
import sys


def main(args=None):
    db = sql.connect('database.db')

    result = db.execute('SELECT * FROM contacts')
    rows = result.fetchall()
    for row in rows:
        print(row)

    for row in rows:
        print(row[0], row[1], row[2])

    print()
    try:
        result = db.execute('SELECT * FROM contacts WHERE first_name LIKE ?', (args[0],))
        print(result.fetchall()[0][4])
    except IndexError:
        print('Contact not found')

    db.close()


if __name__ == '__main__':
    main(sys.argv[1:])
