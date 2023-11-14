
Two different internal representations for the Point2D abstract type.

BUT, just one Point2D.h header file and one testing_Point2D.c file.

Compile with

gcc -Wall -Wextra testing_Point2D.c Point2D_XY.c -o testing_Point2D_XY

gcc -Wall -Wextra testing_Point2D.c Point2D_Polar.c -o testing_Point2D_Polar