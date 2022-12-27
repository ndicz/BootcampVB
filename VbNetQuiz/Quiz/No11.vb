'11.Buat function palindrome. Palindrome adalah jika dibaca dari depan ata belakang memiliki value
'yang sama. Gunakan looping untuk cek kata yang diinput.

Module No11
    Function IsPalindromeLogic(chars As String) As Boolean
        Dim charsSize = chars.Count() - 1

        For idx = 0 To charsSize
            If Not chars(idx) = chars(charsSize - idx) Then
                Return False
            End If
        Next

        Return True
    End Function

    Sub IsPalindrome()
        Dim chars As String
        Console.Write("Input Kata: ")
        chars = Console.ReadLine()

        Dim charsLower = chars.ToLower()

        Console.WriteLine(IsPalindromeLogic(charsLower))
    End Sub
End Module
