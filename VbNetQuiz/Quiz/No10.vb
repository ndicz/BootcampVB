Module No10
    Function IsCharUniqueLogic(chars As String) As Boolean
        Dim charsSize = chars.Count() - 1

        For charA = 0 To charsSize
            For charB = charA + 1 To charsSize
                If chars(charA) = chars(charB) Then
                    Return False
                End If
            Next
        Next

        Return True
    End Function

    Sub IsCharUnique()
        Dim characters As String
        Console.Write("Input Character : ")
        characters = Console.ReadLine

        Console.WriteLine($"{characters} = {IsCharUniqueLogic(characters)}")
    End Sub
End Module
