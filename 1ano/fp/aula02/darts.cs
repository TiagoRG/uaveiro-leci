// .NET core 6.0

namespace Darts
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Introduza as coordenadas (x, y) do dardo.\nRepresentam as posições horizontal e vertical respetivamente.\nAmbas em milimetros.");
            Console.Write("X: ");
            int x = Convert.ToInt32(Console.ReadLine());
            Console.Write("Y: ");
            int y = Convert.ToInt32(Console.ReadLine());
                
            double mod = Math.Sqrt(Math.Pow(x, 2) + Math.Pow(y, 2));

            if (mod > 170)
            {
                Console.WriteLine("Fora do alvo.");
                Console.ReadKey();
                return;
            }

            if (mod < 12.7)
            {
                Console.WriteLine("Pontuação: 50 points");
                Console.ReadKey();
                return;
            }
            else if (mod < 32)
            {
                Console.WriteLine("Pontuação: 25 points");
                Console.ReadKey();
                return;
            }

            int basePoint = BasePoint(x, y);

            if (mod > 99 && mod < 107)
            {
                Console.WriteLine($"Pontuação: {basePoint * 3} points");
                Console.ReadKey();
                return;
            }
            if (mod > 162)
            {
                Console.WriteLine($"Pontuação: {basePoint * 2} points");
                Console.ReadKey();
                return;
            }

            Console.WriteLine($"Pontuação: {basePoint} points");
            Console.ReadKey();
            return;
        }

        public static int BasePoint(int x, int y)
        {
            if (x > 0)
            {
                if (Math.Abs(y) < x * Math.Tan(Math.PI / 20))
                    return 6;
                else
                {
                    if (y > 0)
                    {
                        if (y < x * Math.Tan(3 * Math.PI / 20))
                            return 13;
                        if (y < x * Math.Tan(5 * Math.PI / 20))
                            return 4;
                        if (y < x * Math.Tan(7 * Math.PI / 20))
                            return 18;
                        if (y < x * Math.Tan(9 * Math.PI / 20))
                            return 1;
                        else
                            return 20;
                    }
                    else
                    {
                        if (y > x * Math.Tan(-3 * Math.PI / 20))
                            return 10;
                        if (y > x * Math.Tan(-5 * Math.PI / 20))
                            return 15;
                        if (y > x * Math.Tan(-7 * Math.PI / 20))
                            return 2;
                        if (y > x * Math.Tan(-9 * Math.PI / 20))
                            return 17;
                        else
                            return 3;
                    }
                }
            }
            else
            {
                if (Math.Abs(y) < x * Math.Tan(Math.PI + Math.PI / 20))
                    return 11;
                else
                {
                    if (y > 0)
                    {
                        if (y < x * Math.Tan(Math.PI + 3 * Math.PI / 20))
                            return 14;
                        if (y < x * Math.Tan(Math.PI + 5 * Math.PI / 20))
                            return 9;
                        if (y < x * Math.Tan(Math.PI + 7 * Math.PI / 20))
                            return 12;
                        if (y < x * Math.Tan(Math.PI + 9 * Math.PI / 20))
                            return 5;
                        else
                            return 20;
                    }
                    else
                    {
                        if (y > x * Math.Tan(Math.PI + -3 * Math.PI / 20))
                            return 8;
                        if (y > x * Math.Tan(Math.PI + -5 * Math.PI / 20))
                            return 16;
                        if (y > x * Math.Tan(Math.PI + -7 * Math.PI / 20))
                            return 7;
                        if (y > x * Math.Tan(Math.PI + -9 * Math.PI / 20))
                            return 19;
                        else
                            return 3;
                    }
                }
            }
        }
    }
}