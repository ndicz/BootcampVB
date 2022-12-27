'Buat program untuk menampilkan deretan angka urut seperti :
'-1,1,-2,2-3,3,-4,4,-5,5,-6,6,-7,7-8,8,-9,9,-10,10-11,11,-12,12,-13

Module No6
    Sub OrderWithNegative()
        Dim nums As Integer
        Console.Write("Input deretan angka: ")
        nums = Console.ReadLine

        For index = 1 To nums
            If nums = index Then
                Console.Write($"-{index}")
            Else
                Console.Write($"-{index},")
            End If

            If nums = index Then
                Console.Write("")
            Else
                Console.Write($"{index},")
            End If
        Next

        Console.WriteLine()
    End Sub
End Module
