namespace belajar2;
class Program
{
    static void Main(string[] args)
    {
        // int myInt = 10;
        // double myDouble = 5.25;
        // bool myBool = true;

        // Console.WriteLine(Convert.ToString(myInt));    // Convert int to string
        // Console.WriteLine(Convert.ToDouble(myInt));    // Convert int to double
        // Console.WriteLine(Convert.ToInt16(myDouble));   // Convert bool to string

        Console.WriteLine("Enter your age:");
        int age = Convert.ToInt32(Console.ReadLine());
        Console.WriteLine("Your age is: " + age);
    }
}
