Imports System.Reflection

Module No7
    Sub AngkaKotak()
        Dim nums As Integer
        Console.Write("Input deretan angka: ")
        nums = Console.ReadLine

        For idx = 1 To 5
            If idx Mod 2 = 0 Then
                For index = 1 To nums
                    Console.Write(index)
                Next
            Else
                For index = nums To 1 Step -1
                    Console.Write(index)
                Next
            End If
            Console.WriteLine()
        Next
    End Sub
End Module
