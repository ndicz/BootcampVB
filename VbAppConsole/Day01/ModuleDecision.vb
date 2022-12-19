Module ModuleDecision
    Sub OddEvenNumber()
        Dim num As Integer
        Console.Write("Input to check number is even or odd : ")
        num = Console.ReadLine()

        If num Mod 2 = 0 Then 
            Console.WriteLine("Even Number")
        Else
            Console.WriteLine("Odd Number")
        End If
    End Sub

    Sub Grade()
        Dim grade As Integer
        Console.Write("Enter the number: ")
        grade = Console.ReadLine()

        If grade < 50 Then 
            Console.WriteLine("E")
        ElseIf (grade >= 50) And (grade <= 60) Then
            Console.WriteLine("D")
        Else
            Console.WriteLine("Failed")
        End If
    End Sub 

    Sub GradeCase()
        Dim grade As Integer
        Console.Write("Enter a number:")
        grade = Console.ReadLine()

        Select Case grade 
            Case < 50
                Console.WriteLine("E")
            Case 50 To 60
                Console.WriteLine("D")
            Case 60 To 70
                Console.WriteLine("C")
            Case Else
                Console.WriteLine("Out of Range") 
        end Select
    End Sub

    'Random Number
    Sub WhoIsTheGreatest()
        Dim num As Integer
        Dim rnd As New Random()

        Console.Write("Enter a value Between [1-10] : ")
        num = Console.ReadLine()

        If (num > 10) Or (num < 0) Then 
            Console.WriteLine("Out of Range")
        Else
            Dim guess As Integer = rnd.NextInt64(1, 11)
            Console.WriteLine("Your Input: " & num & vbCrLf & "Computer : " & guess)

            If (num < guess) Then
                Console.WriteLine("You Lose!")
            ElseIf num = guess Then
                Console.WriteLine("Draw!")
            Else
                Console.WriteLine("You Win!")
            End If
        End If
    End Sub
End Module