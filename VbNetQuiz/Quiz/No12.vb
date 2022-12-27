Imports System.Runtime.Remoting.Contexts
Imports Microsoft

Module No12
    Sub MaxWordLength()
        Dim chars As String
        Console.Write("Input Kata: ")
        chars = Console.ReadLine()

        Dim words = chars.Split(" ")
        Dim daBigLen = 0
        Dim daBigWord = ""

        For idx = 0 To words.Count() - 1

            If words(idx).Length > daBigLen Then
                daBigWord = words(idx)
                daBigLen = words(idx).Length
            End If
        Next

        Console.WriteLine(daBigWord)
    End Sub

    Sub AnotherWordLength()
        Dim words As String
        Dim head, tail, maxLength, counter As Int16
        Console.Write("Input Kata: ")
        words = Console.ReadLine()

        For i = 0 To words.Count() - 1
            If words(i) = " " Then
                If counter > maxLength Then
                    tail = i
                    maxLength = counter
                    counter = 0
                End If

                head = i - tail + 2
            End If

            counter += 1
        Next

        Console.WriteLine(words.Substring(head, tail - head))

    End Sub

    Sub Terpanjang()
        Dim words = "alvan coba ada kamus coba tidak panjang mantapp"
        Dim splitedWords = words.Split(" ")

        Dim daBigLen = 0
        Dim daBigWord = "" 'alvan 
        Dim rllyLen = 0

        For idx = 0 To splitedWords.Count() - 1

            If splitedWords(idx).Length >= daBigLen Then
                daBigLen = splitedWords(idx).Length
                daBigWord += splitedWords(idx) & " "
                If splitedWords(idx).Length > rllyLen Then
                    daBigWord = splitedWords(idx) & " "
                    rllyLen = splitedWords(idx).Length
                End If
            End If
        Next

        Console.WriteLine(daBigWord, daBigLen)

    End Sub
End Module
