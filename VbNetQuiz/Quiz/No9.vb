Module No9
    Sub ShowPrimeNumber()
        Dim nums As Integer
        Dim counterNewLine = 0
        Console.Write("Input deretan angka: ")
        nums = Console.ReadLine()


        For outer = 2 To nums
            Dim devidedFactor = 0

            For inner = 2 To outer
                If outer Mod inner = 0 Then
                    devidedFactor += 1
                End If
            Next

            If devidedFactor = 1 Then
                Console.Write($"{outer}" & vbTab)
                counterNewLine += 1
                If counterNewLine = 5 Then
                    Console.WriteLine()
                    counterNewLine = 0
                End If
            End If
        Next

        Console.WriteLine()

    End Sub
End Module
