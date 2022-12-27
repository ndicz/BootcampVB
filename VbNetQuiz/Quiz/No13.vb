'13.Buat function untuk menghitung berapa jumlah tahun kabisat dari tahun1 ke tahun 2. Tahun
'kabisat adalah tahun yang habis dibagi 400 atau tahun yang habis dibagi 4 dan jika dibagi 100
'tidak sama dengan 0.

Module No13
    Sub AnotherHowManyKabisat()
        Console.Write("Input Tahun 1 : ")
        Dim Year1 As Integer = Console.ReadLine()
        Console.Write("Input Tahun 2 : ")
        Dim Year2 As Integer = Console.ReadLine()

        Dim Years = " "
        Dim YearsCount = 0

        For yr = Year1 To Year2
            If yr Mod 400 = 0 Or yr Mod 4 = 0 And Not (yr Mod 100 = 0) Then
                Years += yr & " "
                YearsCount += 1
            End If
        Next

        Console.Write($"Total Tahun Kabisat : {YearsCount} Tahun = ")
        Console.WriteLine(Years)
    End Sub

    Sub HowManyKabisat()
        Console.Write("Input Tahun 1 : ")
        Dim Year1 As Integer = Console.ReadLine()
        Console.Write("Input Tahun 2 : ")
        Dim Year2 As Integer = Console.ReadLine()
        Dim startArrayIdx = 0
        Dim totalYr(1) As Integer

        For yr = Year1 To Year2
            If yr Mod 400 = 0 Or yr Mod 4 = 0 And Not (yr Mod 100 = 0) Then
                ReDim Preserve totalYr(startArrayIdx)
                totalYr(startArrayIdx) = yr
                startArrayIdx += 1
            End If
        Next

        Console.Write($"Total Tahun Kabisat : {totalYr.Count()} Tahun = ")
        For Each yr As String In totalYr
            Console.Write($"{yr} ")
        Next

        Console.WriteLine()
    End Sub
End Module
