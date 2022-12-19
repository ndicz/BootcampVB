Module ModuleVariables
    'Declaration is porcess reserve a portion in main memory for stroing content variable
    'Primitive Data Type : Boolean, Byte, Short, Integer, Long, Single, Double, Decimal & Char
    Sub StoreVariable()
        Dim number As Integer = 200
        Dim myName As String = "Bootcamp.NET"
        Console.WriteLine("Sum :" & number & ", myname : " & myName)

        myName = "CodeId"
        number = 500

        Console.WriteLine("Sum :" & number & ", myname : " & myName)
    End Sub

    'store constant variable
    Sub StoreConstant()
        Const PHI = 3.14159
        Console.WriteLine("The PHI : " & PHI)
    End Sub

    'variable a, b, c
    'a=1, b=2, c=3 => a=3, b=1, c=2
    Sub SwapTwoVariable()
        Dim a, b, c, temp As Integer
        Console.Write("Value A : ")
        a = Console.ReadLine()

        Console.Write("Value B : ")
        b = Console.ReadLine()

        Console.Write("Value C : ")
        c = Console.ReadLine()

        Console.WriteLine("Before : a=" & a & " b=" & b & " c=" & c)
        temp = a
        a = c
        c = b
        b = temp

        Console.WriteLine("Before : a=" & a & " b=" & b & " c=" & c)

    End Sub
End Module
