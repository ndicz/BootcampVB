'(TebakHadiah). Buat program permainan tebak berhadiah. User input dua digit angka integer
'dalam skala(10 - 99). Computer akan mengacak jawaban dalam dua digit. Contoh

Imports System.Linq.Expressions

Module No5
    Function TebakHadiahLogic(num As Integer) As String
        Dim rnd As New Random
        Dim exact = 0

        Dim compRandom = rnd.Next(10, 100)
        'Dim compRandom = 45
        Console.WriteLine($"Komputer Random: {compRandom}")

        If compRandom = num Then
            Return "Match all digit: you win Rp. 100.000"
        End If

        Dim rndString = compRandom.ToString
        Dim numString = num.ToString

        For index = 0 To rndString.Count - 1
            For indek = 0 To index
                If rndString(index) = numString(indek) Then
                    exact += 1
                End If
            Next
        Next

        'Console.WriteLine(exact)

        If exact >= 1 Then
            Return "Exact Match : you win Rp.50.000"
        End If

        Return "You Lose!"

    End Function

    Sub TebakHadiah()
        Dim userInput As Integer
        Console.Write("User Input: ")
        userInput = Console.ReadLine
        Console.WriteLine(TebakHadiahLogic(userInput))
    End Sub
End Module
