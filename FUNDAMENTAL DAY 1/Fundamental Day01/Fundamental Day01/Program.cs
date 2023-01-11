//// See https://aka.ms/new-console-template for more information
//Console.WriteLine("Hello, World!");
    using System;

namespace Fundamental // Note: actual namespace depends on the project name.
{
    internal class Program
    {
        static void Main(string[] args)
        {

            //---------------------------------NO 1 --------------------------//

            //Console.WriteLine("Masukan Angka: ");
            //string input = Console.ReadLine();
            //char[] numbers = input.ToCharArray();

            //int sum = 0;

            //for (int i = 0; i < numbers.Length; i++)
            //{
            //    sum += Convert.ToInt32(numbers[i].ToString());
            //}

            //Console.WriteLine("Hasil Penjumlahan " + sum);


            //---------------------------------NO 2 --------------------------//

            //Console.WriteLine("Masukan Angka: ");
            //string input2 = Console.ReadLine();
            //char[] numbers2 = input2.ToCharArray();

            //int count = 0;

            //for (int i = 0; i < numbers2.Length; i++)
            //{
            //    count++;

            //}

            //Console.WriteLine("Hasil Count " + count);

            //---------------------------------NO 3 --------------------------//
            // Console.WriteLine("Masukan Angka: ");
            // string input3 = Console.ReadLine();
            // char[] numbers3 = input3.ToString().ToCharArray();
            // Array.Reverse(numbers3);
            // string spasireverse = string.Join(" ", numbers3);

            //Console.WriteLine(spasireverse);


            //---------------------------------NO 4 --------------------------//

            //int max = int.MinValue;

            //for (int i = 1; i > 0; i++)
            //{
            //    Console.Write("Masukkan angka: ");
            //    int input = Convert.ToInt32(Console.ReadLine());
            //    if (input == 0)
            //    {
            //        break;
            //    }
            //    if (input > max)
            //    {
            //        max = input;
            //    }
            //}
            //Console.WriteLine("Angka terbesar: " + max);


            //---------------------------------NO 5 --------------------------//

            //Console.Write("Masukkan bilangan: ");
            //int num = int.Parse(Console.ReadLine());
            //for (int i = 1; i <= num; i++)
            //{
            //    if (num % i == 0)
            //    {
            //        Console.Write(i + " ");
            //    }



            //}

            //---------------------------------NO 6 --------------------------//

            //Console.Write("Masukkan batas atas bilangan prima: ");
            //int n = int.Parse(Console.ReadLine());
            //for (int i = 2; i <= n; i++)
            //{
            //    if (Enumerable.Range(2, (int)Math.Sqrt(i) - 1).All(x => i % x != 0))
            //        Console.WriteLine(i);
            //}

            //---------------------------------NO 7 --------------------------//
            //Console.WriteLine("Masukkan Kalimat:");

            //string input = Console.ReadLine();
            //string[] words = input.Split(" ");
            //string[] output = words.Select(s => s.First() + new string('*', s.Length - 2) + s.Last()).ToArray();
            //string finalOutput = string.Join(" ", output);
            //Console.WriteLine(finalOutput);


            //---------------------------------NO 8 --------------------------//
            var currentDay = DateTime.Now;
            var daysUntilSaturday = ((int)DayOfWeek.Saturday - (int)currentDay.DayOfWeek + 7) % 7;
            var nextSaturday = currentDay.AddDays(daysUntilSaturday);
            Console.WriteLine("Hari Sabtu {0}", nextSaturday.ToString("dd/MM/yyyy"));
            Console.WriteLine("{0} hari lagi", daysUntilSaturday);
           

        }
    }


}

