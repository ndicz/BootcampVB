'(Batu-Gunting-Kertas). Buat program permainan gunting-batu-kertas antar user dan computer.
'User meng-input sesuai display yang diberikan, tampilkan hasil game seperti berikut 
'Pilih :(1) Gunting
'       (2) Batu
'       (3) Kertas
' Output : Anda memilih (1)Gunting < > Komputer memilih (3) Kertas. Anda menang.

Module No4
    Sub PrintOutput(clientAnswer As Integer, guess As Integer, n() As String)
        Console.Write($"Output : Anda memilih ({clientAnswer + 1}) {n(clientAnswer)} < > Komputer memiliih ({guess + 1}) {n(guess)}. ")
    End Sub

    Sub BatuGuntingKertasLogic(clientAnswer As Integer)
        Dim rnd As New Random()
        Dim n() As String = {"Gunting", "Batu", "Kertas"}

        Dim guess As Integer = rnd.Next(0, 3)

        If clientAnswer = guess Then
            PrintOutput(clientAnswer, guess, n)
            Console.WriteLine("Draw!")
        ElseIf Not clientAnswer = guess Then
            If clientAnswer = 0 And guess = 1 Then
                PrintOutput(clientAnswer, guess, n)
                Console.WriteLine($" Anda Kalah!.")
            End If

            If clientAnswer = 1 And guess = 0 Then
                PrintOutput(clientAnswer, guess, n)
                Console.WriteLine($" Anda Menang!.")
            End If

            If clientAnswer = 0 And guess = 2 Then
                PrintOutput(clientAnswer, guess, n)
                Console.WriteLine($" Anda Menang!.")
            End If

            If clientAnswer = 2 And guess = 0 Then
                PrintOutput(clientAnswer, guess, n)
                Console.WriteLine($" Anda Kalah!.")
            End If

            If clientAnswer = 2 And guess = 1 Then
                PrintOutput(clientAnswer, guess, n)
                Console.WriteLine($" Anda Menang!.")
            End If

            If clientAnswer = 1 And guess = 2 Then
                PrintOutput(clientAnswer, guess, n)
                Console.WriteLine($" Anda Kalah!.")
            End If
        End If
    End Sub

    Sub BatuGuntingKertas()
        While True
            Dim clientOption As Integer
            Dim playAgain As Char

            Console.WriteLine($"Pilih : (1) Gunting")
            Console.WriteLine($"        (2) Batu")
            Console.WriteLine($"        (3) Kertas")

            Console.Write("Tulis : ")
            clientOption = Console.ReadLine()

            If clientOption > 3 Then
                Console.Clear()
                Continue While
            End If

            BatuGuntingKertasLogic(clientOption - 1)

            Console.Write("Apakah anda ingin bermain lagi?[Y/n] : ")
            playAgain = Console.ReadLine()

            If playAgain = "Y" Then
                Continue While
            End If

            Exit While

        End While
    End Sub
End Module
