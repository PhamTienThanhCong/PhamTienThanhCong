using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BaiThiGiuaKi
{
    internal class Program
    {
        static double f(double x)
        {
            double Tong;
            Tong = 2 * x + 5 * x * x - x * x * x;
            Tong = Math.Round(Tong, 2);
            return Tong;
        }
        static bool tam_gia_vuong(int[] x)
        {
            int a = x[0] * x[0];
            int b = x[1] * x[1];
            int c = x[2] * x[2];
            if (x[0] >= x[1] + x[2] || x[1] >= x[0] + x[2] || x[2] >= x[1] + x[0])
            {
                return false;
            }
            if (b == a + c || a == b + c || c == a + b)
            {
                return true;
            }
            return false;

        }

        static double gui_tiet_kiem(double x, double lx, int n)
        {
            for (int i = 0; i < n; i++)
            {
                x = x + x * lx / 100;
            }
            return Math.Round(x, 2); ;
        }

        static bool check_distinct(int[] x)
        {
            for (int i = 0; i < x.Length; i++)
            {
                for (int j = i + 1; j < x.Length; j++)
                {
                    if (x[i] == x[j])
                    {
                        return false;
                    }
                }
            }
            return true;
        }

        static int cong_chu_so(int x)
        {
            int Tong = 0;
            if (x < 1)
            {
                return 0;
            }
            while (x > 0)
            {
                Tong = Tong + x%10;
                x = x / 10;
            }
            if (Tong > 9)
            {
                Tong = cong_chu_so(Tong);
            }
            return Tong;

        }
        static void Main(string[] args)
        {
            Console.WriteLine("Pham Tien Thanh Cong. mssv: 20010886");
            double x1;
            Console.WriteLine("Bai 1 nhap x tinh f(x):");
            x1 = Convert.ToDouble(Console.ReadLine());
            Console.WriteLine(f(x1));

            int[] x2 = new int[4];
            Console.WriteLine("Bai 2 Nhap lan luot 3 canh tam giac:");
            for (int i = 0; i < 3; i++)
            {
                x2[i] = Convert.ToInt32(Console.ReadLine());
            }
            Console.WriteLine(tam_gia_vuong(x2));

            Console.WriteLine("Bai 3 Nhap So Tien -> lai xuat -> nam gui:");
            double x3, lx;
            int n3;
            x3 = Convert.ToDouble(Console.ReadLine());
            lx = Convert.ToDouble(Console.ReadLine());
            n3 = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine(gui_tiet_kiem(x3, lx, n3));

            int n4;
            Console.WriteLine("Bai 4 Nhap mang:");
            Console.Write("Size: ");
            n4 = Convert.ToInt32(Console.ReadLine());
            int[] x4 = new int[n4];
            for (int i = 0; i < n4; i++)
            {
                x4[i] = Convert.ToInt32(Console.ReadLine());
            }
            Console.WriteLine(check_distinct(x4));

            Console.WriteLine("Bai 5 Nhap So:");
            int n5;
            n5 = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine(cong_chu_so(n5));
        }
    }
}
