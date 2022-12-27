Module No8
    Sub Star()
        StarOdd()
        Console.WriteLine()
        StarEven()
    End Sub

    Sub StarOdd()
        For index = 6 To 1 Step -1
            For idx = 1 To index
                Console.Write($"{idx} ")
            Next
            Console.WriteLine()
        Next
    End Sub

    Sub StarEven()
        For index = 5 To 1 Step -1
            For idx = index To 1 Step -1
                Console.Write($"{idx} ")
            Next
            Console.WriteLine()
        Next
    End Sub
End Module
