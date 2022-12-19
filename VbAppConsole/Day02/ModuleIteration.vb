Imports System.IO

Module ModuleIteration
    Sub DoWhile(n As Integer)
        Dim i As Integer = 1
        Do While i <= n
            Console.WriteLine(i)
            i += 1
        Loop
        Console.WriteLine("End Do-While")
    End Sub

    Sub DoWhileExit(n As Integer)
        Dim i As Integer = 1
        Do While i <= n
            Console.WriteLine(i)
            If (i = 8) Then
                Exit Do
                'Continue Do
            Else
                i += 1
            End If
        Loop
        Console.WriteLine("End Do-WhileExit")
    End Sub

    Sub ForLoop()
        For i = 1 To 10
            Console.Write("*")
            'If index Mod 2 = 0 Then
            'Continue For
            'Else
            'Console.WriteLine(index)
            'End If
        Next
        Console.WriteLine("End For Iteration")
    End Sub

    Sub KotakBintang(num As Integer)
        For i = 1 To num
            'pindah baris
            For j = 1 To num - i
                'cetak horizontal
                Console.Write("* ")
            Next
            Console.WriteLine()
        Next
    End Sub

    Sub WhileLoop(num As Integer)

        While True
            Console.WriteLine(num)
            num -= 1
            If num = 0 Then
                Exit While
            End If
        End While
    End Sub
End Module
