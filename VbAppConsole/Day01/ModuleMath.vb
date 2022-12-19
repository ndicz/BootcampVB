Module ModuleMath
    Sub OperationMath() 
        Dim num As Double
        num = 12 + (15 * 3) - 2 ^ 3 / 4 * 5 'Divides two numbers and returns an integer result.
        Console.WriteLine(num)
    End Sub 

    'pembagian dan sisa 
    Sub BagiSisa()
        Dim num1, num2, bagi, sisa As Integer

        Console.Write("Enter number1: ")
        num1 = Console.ReadLine()
        Console.Write("Enter number2: ")
        num2 = Console.ReadLine()
        
        'result
        bagi = num1 \ num2 'Divides two numbers and returns a floating-point result.
        sisa = num1 Mod num2
        Console.WriteLine("Result bagi: " & bagi & " Sisa " & sisa)
    End Sub
End Module
